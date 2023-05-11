package com.zhao.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.mysql.jdbc.StringUtils;
import com.zhao.common.Result;
import com.zhao.entity.Role;
import com.zhao.service.Impl.RoleServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/role")
public class RoleController {

    @Autowired
    RoleServiceImpl roleService;

    @GetMapping("/all")
    public Result findAll(){
        List<Role> list = roleService.list();
        return Result.success(list);
    }

    // 新增和修改
    @PostMapping("/save")
    public Result save(@RequestBody Role role) {
        return Result.success(roleService.saveOrUpdate(role));
    }

    // 删除
    @DeleteMapping("/{id}")
    public Result delete(@PathVariable("id") Integer id) {
        return Result.success(roleService.removeById(id));
    }

    @PostMapping("/del/batch")
    // @RequestBody 前端传递过来的json转成我们Java对象
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        return Result.success(roleService.removeByIds(ids));
    }

    // mybatis-plus分页
    @GetMapping("/page")
    public Result findPage(@RequestParam Integer pageNum,
                           @RequestParam Integer pageSize,
                           @RequestParam(defaultValue = "") String name){
        Page<Role> page = new Page<>(pageNum, pageSize);
        QueryWrapper<Role> queryWrapper = new QueryWrapper<>();
        if (!StringUtils.isNullOrEmpty(name)) {
            queryWrapper.like("name", name);
        }
        return Result.success(roleService.page(page, queryWrapper));
    }

    /**
     * 绑定角色和菜单的关系
     * @param roleId 角色id
     * @param menuIds 菜单id数组
     * @return
     */
    @PostMapping("/roleMenu/{roleId}")  // 保存的时候使用
    public Result roleMenu(@PathVariable("roleId") Integer roleId, @RequestBody List<Integer> menuIds) {
        roleService.setRoleMenu(roleId, menuIds);
        return Result.success();
    }

    @GetMapping("/roleMenu/{roleId}")  // 打开菜单的时候使用
    public Result getRoleMenu(@PathVariable("roleId") Integer roleId) {
        return Result.success( roleService.getRoleMenu(roleId));
    }

}
