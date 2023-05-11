package com.circle.service.Impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.circle.entity.Files;
import com.circle.mapper.FileMapper;
import com.circle.service.FileService;
import org.springframework.stereotype.Service;

@Service
public class FileServiceImpl extends ServiceImpl<FileMapper, Files> implements FileService {
}
