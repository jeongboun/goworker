package org.mvc.service;

import java.util.List;

import org.mvc.bean.Manage_MemberDTO;
import org.mvc.mybatis.Manage_MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;

@Service
public class Manage_MemberServiceImpl implements Manage_MemberService{
	/*
	 * @Inject Manage_MemberDAOImpl memberDao;
	 */
		@Setter(onMethod_=@Autowired)
		private Manage_MemberMapper memberDao;

		@Override
		public List<Manage_MemberDTO> memberList() {
			return memberDao.memberList();
		}

		@Override
		public void insertMember(Manage_MemberDTO dto) {
			memberDao.insertMember(dto);
		}
		@Override
		public Manage_MemberDTO viewMember(String Id) {
			return memberDao.viewMember(Id);
		}

		@Override
		public void deleteMember(String Id) {
			memberDao.deleteMember(Id);
		}

		@Override
		public void updateMember(Manage_MemberDTO dto) {
			memberDao.updateMember(dto);
		}

		@Override
		public boolean checkPw(String Id, String rPw) {
			return memberDao.checkPw(Id, rPw);
		}

	}
