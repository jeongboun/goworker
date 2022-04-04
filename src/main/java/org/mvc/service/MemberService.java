package org.mvc.service;

import org.mvc.bean.MemberDTO;


public interface MemberService {

	public int memberInsert(MemberDTO dto);

	public int memberUserInfoUpdate(MemberDTO dto);

	public int userLoginCheck(MemberDTO dto);

	public int memberNameCheck(MemberDTO dto);

	public int findmemberName(MemberDTO dto);

	public int RecentllyMonthUserPoint(MemberDTO dto);

	public int idCheck(String id);

	public int getKakaoId(String kid);

	public int kakaoInsert(String kid, String gender , String connected_at);

	public String findId(MemberDTO dto);
	public String findPw(MemberDTO dto);


}
