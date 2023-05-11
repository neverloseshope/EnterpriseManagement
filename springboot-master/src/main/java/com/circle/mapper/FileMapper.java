package com.circle.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.circle.entity.Files;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface FileMapper extends BaseMapper<Files> {
}
