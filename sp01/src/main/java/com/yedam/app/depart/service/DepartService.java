package com.yedam.app.depart.service;

import java.util.List;

public interface DepartService {
	// 부서 전체조회
	public List<DepartVO> getDepartAll();
	
	// 부서조회
	public DepartVO getDepartInfo(DepartVO departVO);
	
	// 부서등록
	public int insertDepartInfo(DepartVO departVO);
}
