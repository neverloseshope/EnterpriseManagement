package com.circle.entity;


import cn.hutool.core.annotation.Alias;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName("sys_user")
public class User implements Serializable {

    private static final long serialVersionID = 1L;

    @Alias("用户id")  //自定义标题别名
    @TableId(type = IdType.AUTO)
    private Integer id;

    @Alias("用户名")
    private String username;

    @JsonIgnore
    @Alias("密码")
    private String password;

    @Alias("昵称")
    private String nickname;

    @Alias("邮箱")
    private String email;

    @Alias("电话")
    private String phone;

    @Alias("地址")
    private String address;

    @Alias("头像")
    private String avatarUrl;

    @Alias("创建时间")
    @JsonIgnore
    private Date createTime;

    @Alias("角色")
    private Integer role;
}
