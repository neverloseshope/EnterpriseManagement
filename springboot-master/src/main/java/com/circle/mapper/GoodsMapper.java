package com.circle.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.circle.entity.Goods;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface GoodsMapper extends BaseMapper<Goods> {
}
