package com.zhao.entity;


import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName("sys_role")
public class Role  implements Serializable {

    private static final long serialVersionID = 1L;
     //自定义标题别名
    @TableId(type = IdType.AUTO)
    private Integer id;

    private String name;

    private String description;

    private String flag;// 唯一标识

}
