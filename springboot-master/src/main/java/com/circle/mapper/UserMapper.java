package com.circle.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.circle.controller.dto.UserPasswordDto;
import com.circle.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface UserMapper extends BaseMapper<User> {

    @Update("update sys_user set password = #{newPassword} where username = #{username} and password = #{password}")
    int updatePassword(UserPasswordDto userPasswordDto);
}
