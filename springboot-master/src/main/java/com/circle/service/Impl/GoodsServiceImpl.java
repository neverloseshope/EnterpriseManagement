package com.circle.service.Impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.circle.entity.Goods;
import com.circle.mapper.GoodsMapper;
import com.circle.service.GoodsService;
import org.springframework.stereotype.Service;

@Service
public class GoodsServiceImpl extends ServiceImpl<GoodsMapper, Goods> implements GoodsService {
}
