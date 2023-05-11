package com.circle.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.mysql.jdbc.StringUtils;
import com.circle.common.Constants;
import com.circle.common.Result;
import com.circle.entity.Dict;
import com.circle.entity.Menu;
import com.circle.mapper.DictMapper;
import com.circle.service.Impl.MenuServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/menu")
public class MenuController {

    @Autowired
    MenuServiceImpl menuService;

    @Autowired
    DictMapper dictMapper;

    // 查询所有数据
    @GetMapping("/all")
    public Result findAll(@RequestParam(defaultValue = "") String name) {
        return Result.success(menuService.findMenus(name));
    }



    // 新增和修改
    @PostMapping("/save")
    public Result save(@RequestBody Menu menu) {
        return Result.success(menuService.saveOrUpdate(menu));
    }

    // 删除
    @DeleteMapping("/{id}")
    public Result delete(@PathVariable("id") Integer id) {
        return Result.success(menuService.removeById(id));
    }

    @PostMapping("/del/batch")
    // @RequestBody 前端传递过来的json转成我们Java对象
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        return Result.success(menuService.removeByIds(ids));
    }

    // mybatis-plus分页
    @GetMapping("/page")
    public Result findPage(@RequestParam Integer pageNum,
                           @RequestParam Integer pageSize,
                           @RequestParam(defaultValue = "") String name){
        Page<Menu> page = new Page<>(pageNum, pageSize);
        QueryWrapper<Menu> queryWrapper = new QueryWrapper<>();
        if (!StringUtils.isNullOrEmpty(name)) {
            queryWrapper.like("name", name);
        }
        queryWrapper.orderByAsc("id");
        return Result.success(menuService.page(page, queryWrapper));
    }

    @GetMapping("/icons")
    public Result getIcons(){
        QueryWrapper<Dict> wrapper = new QueryWrapper<>();
        wrapper.eq("type", Constants.DICT_TYPE_ICON);
        return Result.success(dictMapper.selectList(wrapper));
    }
}
