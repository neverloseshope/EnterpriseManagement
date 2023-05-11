package com.zhao.service.Impl;


import cn.hutool.core.bean.BeanUtil;
import cn.hutool.log.Log;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zhao.common.Constants;
import com.zhao.controller.dto.UserDto;
import com.zhao.controller.dto.UserPasswordDto;
import com.zhao.entity.Menu;
import com.zhao.entity.User;
import com.zhao.exception.ServiceException;
import com.zhao.mapper.RoleMapper;
import com.zhao.mapper.RoleMenuMapper;
import com.zhao.mapper.UserMapper;
import com.zhao.service.UserService;
import com.zhao.utils.TokenUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service
public class UserServiceImpl extends ServiceImpl<UserMapper,User> implements UserService {

    private static final Log LOG = Log.get();

    @Autowired
    RoleMapper roleMapper;

    @Autowired
    RoleMenuMapper roleMenuMapper;

    @Autowired
    MenuServiceImpl menuService;

    @Resource
    UserMapper userMapper;

    @Override
    public UserDto login(UserDto userDTO) {
        User user = getUserInfo(userDTO);
        if (user != null) {
            BeanUtil.copyProperties(user, userDTO, true);
            // 设置token
            String token = TokenUtils.genToken(user.getId().toString(), user.getPassword());
            userDTO.setToken(token);
            String role = user.getRole(); // ROLE_ADMIN
            // 设置用户的菜单列表
            List<Menu> roleMenus = getRoleMenus(role);
            userDTO.setMenus(roleMenus);
            return userDTO;
        } else {
            throw new ServiceException(Constants.CODE_600, "用户名或密码错误");
        }
    }

    @Override
    public User register(UserDto userDTO) {
        User one = getUserInfo(userDTO);
        if (one == null) {
            one = new User();
            BeanUtil.copyProperties(userDTO, one, true);//****
            one.setRole(Constants.ROLE_USER);
            try {
                save(one);  // 把 copy完之后的用户对象存储到数据库
            } catch (Exception e) {
                throw new ServiceException(Constants.CODE_600, "名称重复");
            }
        } else {
            throw new ServiceException(Constants.CODE_600, "用户已存在");
        }
        return one;
    }


    private User getUserInfo(UserDto userDTO) {
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("username", userDTO.getUsername());
        queryWrapper.eq("password", userDTO.getPassword());
        User one;
        try {
            one = getOne(queryWrapper); // 从数据库查询用户信息
        } catch (Exception e) {
            LOG.error(e);
            throw new ServiceException(Constants.CODE_500, "系统错误");
        }
        return one;
    }

    /**
     * 获取当前角色的菜单列表
     * @param roleFlag
     * @return
     */
    private List<Menu> getRoleMenus(String roleFlag) {
        Integer roleId = roleMapper.selectByFlag(roleFlag);
        // 当前角色的所有菜单id集合
        List<Integer> menuIds = roleMenuMapper.selectByRoleId(roleId);

        // 查出系统所有的菜单(树形)
        List<Menu> menus = menuService.findMenus("");
        // new一个最后筛选完成之后的list
        List<Menu> roleMenus = new ArrayList<>();
        // 筛选当前用户角色的菜单
        for (Menu menu : menus) {
            if (menuIds.contains(menu.getId())) {
                roleMenus.add(menu);
            }
            List<Menu> children = menu.getChildren();
            // removeIf()  移除 children 里面不在 menuIds集合中的 元素
            children.removeIf(child -> !menuIds.contains(child.getId()));
            if (children.size() != 0){
                if (!roleMenus.contains(menu)){
                    roleMenus.add(menu);
                }
            }
        }
        return roleMenus;
    }

    public void updatePassword(UserPasswordDto userPasswordDto) {
        int update = userMapper.updatePassword(userPasswordDto);
        if (update < 1) {
            throw new ServiceException(Constants.CODE_600, "原密码错误");
        }
    }
}
