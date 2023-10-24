package com.yedam.app.location.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.app.location.mapper.LocationMapper;
import com.yedam.app.location.service.LocationService;
import com.yedam.app.location.service.LocationVO;

@Service
public class LocationServiceImpl implements LocationService {
	
	@Autowired
	LocationMapper locationMapper;

	@Override
	public List<LocationVO> getLocationAll() {
		return locationMapper.selectLocationAll();
	}

}
