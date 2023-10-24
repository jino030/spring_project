package com.yedam.app.depart.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.yedam.app.depart.service.DepartService;
import com.yedam.app.depart.service.DepartVO;
import com.yedam.app.emp.service.EmpService;
import com.yedam.app.emp.service.EmpVO;
import com.yedam.app.location.service.LocationService;
import com.yedam.app.location.service.LocationVO;

@Controller
public class DepartController {
	
	@Autowired
	DepartService departService;
	@Autowired
	EmpService empService;
	@Autowired
	LocationService locationService;
	
	// 전체조회
	@GetMapping("departList")
	public String getDepartList(Model model) {
		List<DepartVO> list = departService.getDepartAll();
		model.addAttribute("departList", list);
		return "depart/departList";
	}
	
	// 부서조회
	@GetMapping("departInfo")
	public String getDepartInfo(DepartVO departVO, Model model) {
		DepartVO findVO = departService.getDepartInfo(departVO);
		model.addAttribute("departInfo", findVO);
		return "depart/departInfo";
	}
	
	
	// 부서등록 - Form
	@GetMapping("departInsert")
	public String insertDepartInfoForm(Model model) {
		List<EmpVO> empList = empService.getEmpAll();
		List<LocationVO> locationList = locationService.getLocationAll();
		model.addAttribute("empList", empList);
		model.addAttribute("locationList", locationList);
		return "depart/departInsert";
	}
	
	// 부서등록 - Process
	@PostMapping("departInsert")
	public String insertDepartInfo(DepartVO departVO) {
		String path = null;
		int departId = departService.insertDepartInfo(departVO);
		if(departId > -1) {
			path = "redirect:departInfo?departmentId=" + departId;
		} else {
			path = "redirect:departList";
		}
		return path;
	}

}
