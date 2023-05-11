package com.zhao.service.Impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zhao.entity.Files;
import com.zhao.mapper.FileMapper;
import com.zhao.service.FileService;
import org.springframework.stereotype.Service;

@Service
public class FileServiceImpl extends ServiceImpl<FileMapper, Files> implements FileService {
}
