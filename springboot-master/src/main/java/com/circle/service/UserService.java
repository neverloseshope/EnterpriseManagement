package com.circle.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.circle.controller.dto.UserDto;
import com.circle.entity.User;

public interface UserService extends IService<User> {
    // 注册
    UserDto login(UserDto userDTO);

    User register(UserDto userDTO);


}
