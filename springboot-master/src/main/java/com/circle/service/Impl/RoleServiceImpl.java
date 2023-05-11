package com.circle.service.Impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.circle.entity.Role;
import com.circle.entity.RoleMenu;
import com.circle.mapper.RoleMapper;
import com.circle.mapper.RoleMenuMapper;
import com.circle.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class RoleServiceImpl extends ServiceImpl<RoleMapper, Role> implements RoleService {

    @Autowired
    RoleMenuMapper roleMenuMapper;

    @Transactional
    public void setRoleMenu(Integer roleId, List<Integer> menuIds) {
        // 第一步：先删除当前角色id所有的绑定关系
        QueryWrapper<RoleMenu> wrapper = new QueryWrapper<>();
        wrapper.eq("role_id",roleId);
        roleMenuMapper.delete(wrapper);

        // 第二步 再插入每一个选中的菜单id
        for (Integer menuId : menuIds) {
            RoleMenu roleMenu = new RoleMenu();
            roleMenu.setRoleId(roleId);
            roleMenu.setMenuId(menuId);
            roleMenuMapper.insert(roleMenu);
        }
    }

    public List<Integer> getRoleMenu(Integer roleId) {
        return roleMenuMapper.selectByRoleId(roleId);
    }
}
