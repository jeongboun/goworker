package org.mvc.mybatis;

import java.util.List;

import org.mvc.bean.Manage_MemberDTO;

public interface Manage_MemberMapper {

		public List<Manage_MemberDTO> memberList();

		public void insertMember(Manage_MemberDTO dto);

		public Manage_MemberDTO viewMember(String Id);

		public void deleteMember(String Id);

		public void updateMember(Manage_MemberDTO dto);

		public boolean checkPw(String Id, String Pw);

	}

