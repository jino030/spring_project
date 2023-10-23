package com.yedam.app.emp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.app.emp.service.EmpVO;

public interface EmpMapper {
	// 전체조회 (다건조회)
	public List<EmpVO> selectAllEmpInfo();

	// 사원조회 (단건조회)
	public EmpVO selectEmpInfo(EmpVO empVO);

	// 등록
	public int insertEmpInfo(EmpVO empVO);

	// 수정
	public int updateEmpInfo(EmpVO empVO);

	// 수정 : Dynamic SQL 사용
	public int updateEmpInfoDynamic(EmpVO empVO);

	// 삭제
	// 2개이상의 매개변수를 넘길때 @Param 사용
	public int deleteEmpInfo(@Param("empid") int employeeId);
}
