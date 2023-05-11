package com.zhao.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zhao.controller.dto.UserDto;
import com.zhao.entity.User;

public interface UserService extends IService<User> {
    // 注册
    UserDto login(UserDto userDTO);

    User register(UserDto userDTO);


}
