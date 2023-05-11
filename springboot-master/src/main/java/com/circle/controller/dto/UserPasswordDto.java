package com.circle.controller.dto;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserPasswordDto {
    private String username;
    private String phone;
    private String password;
    private String newPassword;

}
