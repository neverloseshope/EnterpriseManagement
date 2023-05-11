package com.circle.controller;


import cn.hutool.core.date.DateUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.mysql.jdbc.StringUtils;
import com.circle.common.Constants;
import com.circle.common.Result;
import com.circle.entity.Goods;
import com.circle.entity.User;
import com.circle.service.Impl.GoodsServiceImpl;
import com.circle.utils.TokenUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/goods")
public class GoodsController {

    @Value("${files.upload.path}")  // spel表达式
    private String fileUploadPath;

    @Autowired
    GoodsServiceImpl goodsService;

    // 查询所有数据
    @GetMapping("/all")
    public Result index() {
        return Result.success(goodsService.list());
    }

    // 新增和修改
    @PostMapping("/save")
    public Result save(@RequestBody Goods goods) {
        if (goods.getId() == null) {
            // 新增
            goods.setTime(DateUtil.today());
            goods.setUser(TokenUtils.getCurrentUser().getId());
        }
        return Result.success(goodsService.saveOrUpdate(goods));
    }

    // 删除
    @DeleteMapping("/{id}")
    public Result delete(@PathVariable("id") Integer id) {
        return Result.success(goodsService.removeById(id));
    }



    @PostMapping("/del/batch")
    // @RequestBody 前端传递过来的json转成我们Java对象
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        return Result.success(goodsService.removeByIds(ids));
    }

    // mybatis-plus分页
    @GetMapping("/page")
    public Result findPage(@RequestParam Integer pageNum,
                           @RequestParam Integer pageSize,
                           @RequestParam(defaultValue = "") String name){
        Page<Goods> page = new Page<>(pageNum, pageSize);
        QueryWrapper<Goods> queryWrapper = new QueryWrapper<>();
        if (!StringUtils.isNullOrEmpty(name)) {
            queryWrapper.like("name", name);
        }
        queryWrapper.orderByDesc("id");
        User currentUser = TokenUtils.getCurrentUser();
        if (Constants.ROLE_USER.equals(currentUser.getRole())) {  // 角色是普通用户
            queryWrapper.eq("user", currentUser.getUsername()).or().eq("state","审核通过");
        }
        return Result.success(goodsService.page(page, queryWrapper));
    }




}
