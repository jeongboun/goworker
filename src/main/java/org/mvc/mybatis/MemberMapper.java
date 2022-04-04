package org.mvc.mybatis;

import org.apache.ibatis.annotations.Param;
import org.mvc.bean.MemberDTO;


public interface MemberMapper {

	public int input(MemberDTO dto);

	public int UserInfoUpdate(MemberDTO dto);

	public int loginCheck(MemberDTO dto);

	public int userNameCheck(MemberDTO dto);

	public int findUserName(MemberDTO dto);

	public int RecentllyMonthUserPoint(MemberDTO dto);

	public int idCheck(String id);

	public int getKakaoId(String kid);

	public int kakaoInsert(@Param("kid") String kid, @Param("gender") String gender,@Param("connected_at")String connected_at);

	public String findId(MemberDTO dto);
	public String findPw(MemberDTO dto);


}
