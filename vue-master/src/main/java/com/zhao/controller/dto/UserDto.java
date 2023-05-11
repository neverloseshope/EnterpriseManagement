package com.zhao.controller.dto;


import cn.hutool.core.annotation.Alias;
import com.zhao.entity.Menu;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserDto {
    @Alias("用户名")
    private String username;

    @Alias("密码")
    private String password;

    @Alias("昵称")
    private String nickname;

    @Alias("头像")
    private String avatarUrl;

    private String Token;

    @Alias("角色")
    private String role;

    private List<Menu> menus;
}
