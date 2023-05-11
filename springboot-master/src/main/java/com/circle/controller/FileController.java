package com.circle.controller;


import cn.hutool.core.io.FileUtil;
import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.crypto.SecureUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.mysql.jdbc.StringUtils;
import com.circle.common.Constants;
import com.circle.common.Result;
import com.circle.entity.Files;
import com.circle.entity.User;
import com.circle.exception.ServiceException;
import com.circle.service.Impl.FileServiceImpl;
import com.circle.utils.TokenUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

/**
 * 文件上传相关接口
 */
@RequestMapping("/file")
@RestController
public class FileController {

    @Value("${files.upload.path}")  // spel表达式
    private String fileUploadPath;

    @Autowired
    private FileServiceImpl fileService;

    private  static Integer username ;

    // 文件上传
    @PostMapping("/upload")
    public String upload(@RequestParam MultipartFile file) throws IOException {
        String originalFilename = file.getOriginalFilename();
        String type = FileUtil.extName(originalFilename); // 得到文件的扩展名
        long size = file.getSize();

        // 定义一个文件唯一的标识码
        String uuid = IdUtil.fastSimpleUUID();
        String fileUUID = uuid + StrUtil.DOT + type;

        File uploadFile = new File(fileUploadPath + fileUUID);
        // 判断配置的文件目录是否存在，若不存在则创建一个新的文件目录
        File parentFile = uploadFile.getParentFile();
        if(!parentFile.exists()) {
            parentFile.mkdirs();
        }

        String url;
        // 获取文件的md5 ，同一个文件MD5相同
        String md5 = SecureUtil.md5(file.getInputStream());
        // 从数据库查询是否存在相同的记录
        Files dbFiles = getFileByMd5(md5);
        if (dbFiles != null) { // 文件已存在
            url = dbFiles.getUrl();
        } else { // 如果文件已经存在，则只存在数据库而不存到磁盘
            // 上传文件到磁盘
            file.transferTo(uploadFile);
            // 数据库若不存在重复文件，则不删除刚才上传的文件
            url = "http://localhost:9090/file/" + fileUUID;
        }

        // 存储数据库
        Files saveFile = new Files();
        saveFile.setName(originalFilename);
        saveFile.setType(type);
        saveFile.setSize(size/1024); // kb
        saveFile.setUrl(url);
        saveFile.setMd5(md5);
        saveFile.setUser(username);
        fileService.save(saveFile);

        return url;
    }


    // 文件下载接口1
    @GetMapping("/{fileUUID}/{id}")
    public void download(@PathVariable("fileUUID") String fileUUID,
                         @PathVariable("id") Integer id) {
        String url = "http://localhost:9090/file/" + fileUUID;
        QueryWrapper<Files> wrapper = new QueryWrapper<>();
        wrapper.eq("url",url);
        wrapper.eq("id",id);
        Files file = fileService.getOne(wrapper);
        if (file.isEnable()){
            throw new ServiceException(Constants.CODE_600,"您无权限下载");
        }
    }

    // 文件下载接口2
    @GetMapping("/{fileUUID}")
    public void download2(@PathVariable("fileUUID") String fileUUID,
                         HttpServletResponse response) throws IOException {
        // 根据文件的唯一标识码获取文件
        File uploadFile = new File(fileUploadPath + fileUUID);
        // 设置输出流的格式
        ServletOutputStream os = response.getOutputStream();
        response.addHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(fileUUID, "UTF-8"));
        response.setContentType("application/octet-stream");

        // 读取文件的字节流
        os.write(FileUtil.readBytes(uploadFile));
        os.flush();
        os.close();
    }

    // 通过MD5查询文件
    private Files getFileByMd5(String md5) {
        // 查询文件的md5是否存在
        QueryWrapper<Files> wrapper = new QueryWrapper<>();
        wrapper.eq("md5", md5);
        List<Files> filesList = fileService.list(wrapper);
        return filesList.size() == 0 ? null : filesList.get(0);
    }

    // 分页查询
    @GetMapping("/page")
    public Result findPage(@RequestParam Integer pageNum,
                           @RequestParam Integer pageSize,
                           @RequestParam(defaultValue = "") String name) {

        QueryWrapper<Files> wrapper = new QueryWrapper<>();
        // 查询未删除的记录
        Page<Files> page = new Page<>(pageNum, pageSize);
        wrapper.eq("is_delete", 0);
        wrapper.orderByDesc("id");
        if (!StringUtils.isNullOrEmpty(name)) {
            wrapper.like("name", name);
        }
        User currentUser = TokenUtils.getCurrentUser();
        if (Constants.ROLE_USER == currentUser.getRole()) {  // 角色是普通用户
            wrapper.eq("user", currentUser.getId());
            username = currentUser.getId();
        }
        if (username == null){
            username = currentUser.getId();
        }
        return Result.success(fileService.page(page, wrapper));
    }

    // 删除
    @DeleteMapping("/{id}")
    public Result delete(@PathVariable("id") Integer id) {
        return Result.success(fileService.removeById(id));
    }

    @PostMapping("/del/batch")
    // @RequestBody 前端传递过来的json转成我们Java对象
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        return Result.success(fileService.removeByIds(ids));
    }

    // 修改
    @PostMapping("/update")
    public Result update(@RequestBody Files files) {
        return Result.success(fileService.updateById(files));
    }
}
