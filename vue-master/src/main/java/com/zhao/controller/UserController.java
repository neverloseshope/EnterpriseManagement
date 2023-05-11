package com.zhao.controller;

import cn.hutool.core.util.StrUtil;
import cn.hutool.poi.excel.ExcelReader;
import cn.hutool.poi.excel.ExcelUtil;
import cn.hutool.poi.excel.ExcelWriter;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.mysql.jdbc.StringUtils;
import com.zhao.common.Constants;
import com.zhao.common.Result;
import com.zhao.controller.dto.UserDto;
import com.zhao.controller.dto.UserPasswordDto;
import com.zhao.entity.User;
import com.zhao.service.Impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.net.URLEncoder;
import java.util.List;

@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserServiceImpl userService;

    // 查询所有数据
    @GetMapping("/all")
    public Result index() {
        return Result.success(userService.list());
    }

    // 新增和修改
    @PostMapping("/save")
    public Result save(@RequestBody User user) {
        return Result.success(userService.saveOrUpdate(user));
    }

    // 删除
    @DeleteMapping("/{id}")
    public Result delete(@PathVariable("id") Integer id) {
        return Result.success(userService.removeById(id));
    }

    // 查询个人信息
    @GetMapping("/{username}")
    public Result find(@PathVariable("username") String username) {
        QueryWrapper<User> wrapper = new QueryWrapper<>();
        wrapper.eq("username",username);
        return Result.success(userService.getOne(wrapper));
    }

    @PostMapping("/password")   //    /user/password
    public Result password(@RequestBody UserPasswordDto userPasswordDto) {
        userService.updatePassword(userPasswordDto);
        return Result.success();
    }



    @PostMapping("/del/batch")
    // @RequestBody 前端传递过来的json转成我们Java对象
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        return Result.success(userService.removeByIds(ids));
    }

    // mybatis-plus分页
    @GetMapping("/page")
    public Result findPage(@RequestParam Integer pageNum,
                                @RequestParam Integer pageSize,
                                @RequestParam(defaultValue = "") String username,
                                @RequestParam(defaultValue = "") String email,
                                @RequestParam(defaultValue = "") String address){
        Page<User> page = new Page<>(pageNum, pageSize);
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        if (!StringUtils.isNullOrEmpty(username)) {
            queryWrapper.like("username", username);
        }
        if (!StringUtils.isNullOrEmpty(email)) {
            queryWrapper.like("email", email);
        }
        if (!StringUtils.isNullOrEmpty(address)) {
            queryWrapper.like("address", address);
        }
        queryWrapper.orderByDesc("id");
        return Result.success(userService.page(page, queryWrapper));
    }


    // 导出
    @GetMapping("/export")
    public void export(HttpServletResponse response) throws Exception {
        // 从数据库查询出所有的数据
        List<User> list = userService.list();
        // 通过工具类创建writer 写出到磁盘路径
//        ExcelWriter writer = ExcelUtil.getWriter(filesUploadPath + "/用户信息.xlsx");
        // 在内存操作，写出到浏览器
        ExcelWriter writer = ExcelUtil.getWriter(true);
        writer.write(list, true);

        // 设置浏览器响应的格式
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=utf-8");
        String fileName = URLEncoder.encode("用户信息", "UTF-8");
        response.setHeader("Content-Disposition", "attachment;filename=" + fileName + ".xlsx");

        ServletOutputStream out = response.getOutputStream();
        writer.flush(out, true);
        out.close();
        writer.close();
    }

    // 导入
    @PostMapping("/import")
    public Result imp(MultipartFile file) throws Exception {
        ExcelReader reader = ExcelUtil.getReader(file.getInputStream());
        // 方式1：(推荐) 通过 javabean的方式读取Excel内的对象，但是要求表头必须是英文，跟javabean的属性要对应起来
        List<User> users = reader.readAll(User.class);
        return Result.success(userService.saveBatch(users));
    }

    @PostMapping("/login")
    public Result login(@RequestBody UserDto userDTO) {
        String username = userDTO.getUsername();
        String password = userDTO.getPassword();
        if (StrUtil.isBlank(username) || StrUtil.isBlank(password)) { // 判断是否为空
            return Result.error(Constants.CODE_600,"用户名或密码有错误");
        }
        return Result.success(userService.login(userDTO));
    }

    @PostMapping("/register")
    public Result Register(@RequestBody UserDto userDTO){
        String username = userDTO.getUsername();
        String password = userDTO.getPassword();
        if (StrUtil.isBlank(username) || StrUtil.isBlank(password)) { // 判断是否为空
            return Result.error(Constants.CODE_600,"用户名或密码有错误");
        }
        return Result.success(userService.register(userDTO));
    }
}
