package org.mvc.service;

import java.util.List;

import org.mvc.bean.Manage_MemberDTO;

public interface Manage_MemberService {

		public List<Manage_MemberDTO> memberList();

		public void insertMember(Manage_MemberDTO vo);

		public Manage_MemberDTO viewMember(String Id);

		public void deleteMember(String Id);

		public void updateMember(Manage_MemberDTO vo);

		public boolean checkPw(String Id, String Pw);
	}
