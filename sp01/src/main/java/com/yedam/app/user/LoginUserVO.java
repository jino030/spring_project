package com.yedam.app.user;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public class LoginUserVO implements UserDetails {
	
	private UserVO userVO;

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> auths = new ArrayList<>();
		auths.add(new SimpleGrantedAuthority(userVO.getRole()));
		return auths;
	}

	@Override
	public String getPassword() {
		return userVO.getPwd();
	}

	@Override
	public String getUsername() {
		return userVO.getId();
	}

	@Override
	public boolean isAccountNonExpired() { // 계정 만료 여부
		return true;
	}

	@Override
	public boolean isAccountNonLocked() { // 계정 잠금 여부
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() { // 계정 패스워드 만료 여부
		return true;
	}

	@Override
	public boolean isEnabled() { // 계정 사용 가능 여부
		return true;
	}

}
