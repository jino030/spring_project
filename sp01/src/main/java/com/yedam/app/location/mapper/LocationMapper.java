package com.yedam.app.location.mapper;

import java.util.List;

import com.yedam.app.location.service.LocationVO;

public interface LocationMapper {

	// 전체조회
	List<LocationVO> selectLocationAll();
}
