package com.yedam.app.location.service;

import lombok.Data;

@Data
public class LocationVO {
	private int locationId;
	private String streetAddress;
	private String postalCode;
	private String city;
	private String stateProvince;
	private String countryId;
}
