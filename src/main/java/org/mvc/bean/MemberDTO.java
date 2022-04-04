package org.mvc.bean;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;


@Data
public class MemberDTO {

	// SQL fianl01 table member_login with member_info values of column
	private String id;  // 회원고유값

	// SQL final01 table member_login values of column

	private String username;  // 유저ID

	private String password;  // 유저PW

	private int phone_number;  // 유저 전화번호

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birthday;  // 생년월일

	private String gender;  // 성별

	private String email;  //이메일

	private String ip;  // 접속 ip

	private String profile_image;  // 유저 프로필 이미지

	private String plusfriends;  //  사용자와 카카오톡 채널의 관계

	private String thumbnail_image;  //프로필 이미지 썸네일

	private Date reg_date;  // 최초 가입날짜

	private int state;  // 탈퇴 여부 (블록2. 가입유지1. 탈퇴0.)


	// SQL final01 table member2 values of clumn
	private String role;  //사이트내 유저 계급

	private int last_login;  // 마지막 접속일

	private int all_writing;  // 회원의 총 글 갯수

	private int point;  //유저 포인트값

	private int conAttendDay;  //연속 출석 일수

	private int totalAttendDay;  // 총 출석일수








}
