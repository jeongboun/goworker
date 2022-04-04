package org.mvc.service;

import org.mvc.bean.MemberDTO;
import org.mvc.mybatis.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kakao.app.KakaoAPI;

import lombok.Setter;

@Service
public class MemberServiceImpl  implements MemberService{

	@Setter(onMethod_=@Autowired)
	private MemberMapper mapper;
	KakaoAPI kakaoApi = new KakaoAPI();

	@Override
	public int memberInsert(MemberDTO dto) { // 회원가입
		return mapper.input(dto);

	}

	@Override
	public int memberUserInfoUpdate(MemberDTO dto) {
		return mapper.UserInfoUpdate(dto);
	}

	@Override
	public int userLoginCheck(MemberDTO dto) { //로그인시 id pw 확인
		return mapper.loginCheck(dto);
	}

	@Override
	public int memberNameCheck(MemberDTO dto) {
		return mapper.userNameCheck(dto);
	}

	@Override
	public int findmemberName(MemberDTO dto) {
		return mapper.findUserName(dto);
	}

	@Override
	public int RecentllyMonthUserPoint(MemberDTO dto) { //최근 3개월 유저 포인트 조회
		return mapper.RecentllyMonthUserPoint(dto);
	}

	@Override
	public int idCheck(String id) {
		return mapper.idCheck(id);
	}

	@Override
	public int getKakaoId(String kid) {
		return mapper.getKakaoId(kid);
	}

	@Override
	public int kakaoInsert(String kid, String gender, String connected_at) {

		String at = "2022-02-04";

		return mapper.kakaoInsert(kid, gender, at);
	}

	@Override
	public String findId(MemberDTO dto) {
		return mapper.findId(dto)	;
	}

	@Override
	public String findPw(MemberDTO dto) {
		return mapper.findPw(dto);
	}

}
