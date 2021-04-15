package com.jbpark.webstore.config;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

import com.jbpark.webstore.domain.User;
import com.jbpark.webstore.service.UserService;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	@Autowired
	private UserService userService;

	@Autowired
	public void configureGlobalSecurity(AuthenticationManagerBuilder auth) throws Exception {
		List<User> users = userService.getAllUsers(); // db에 저장되어있는 users테이블의 값을 모두 가져와서 리스트에 저장
		for (User u : users) {
			if ("admin".equals(u.getUsername())) { // 하나씩 비교(role을 부여하기 위한 작업)
				auth.inMemoryAuthentication().withUser(u.getUsername()).password(u.getPassword()).roles("USER", "ADMIN"); // user와 Admin 권한 설정
			} else if ("custrep".equals(u.getUsername())) {
				auth.inMemoryAuthentication().withUser(u.getUsername()).password(u.getPassword()).roles("USER", "SERVICE");
			} else {
				auth.inMemoryAuthentication().withUser(u.getUsername()).password(u.getPassword()).roles("USER"); // user로만 설정
			}
		}
	}

	@Override
	protected void configure(HttpSecurity httpSecurity) throws Exception {
		httpSecurity.formLogin().loginPage("/login").usernameParameter("userId").passwordParameter("password"); // login.jsp에
																												// userId와
																												// password값을
																												// 전달받음
		httpSecurity.formLogin().failureUrl("/login?error"); // login 성공하면 SuccesUrl로 보내고 실패하면 login.jsp에
																// jstl:if문(error값이 null이 아니게됨)을 실행
		httpSecurity.logout().logoutSuccessUrl("/login?logout"); // 로그아웃을 누르면 url이 변경됨
		httpSecurity.exceptionHandling().accessDeniedPage("/login?accessDenied"); // 접근권한이 admin이 아니면 실행됨(접근권한이 없는 경우
																					// 해당)
		httpSecurity.authorizeRequests().antMatchers("/").permitAll().antMatchers("/**/products/add").access("hasRole('ADMIN')").antMatchers("/**/customers/add").access("hasRole('SERVICE')")
				.antMatchers("/**/market/**").access("hasRole('USER')"); // antMatchers와 permitAll을 한 세트로 보고 해당url을 모두
																			// 권한을 줌 / access는 해당 user의 조건에 만족하는 데이터에게만
																			// 접속권한을 줌
		httpSecurity.csrf().disable();
	}
}
