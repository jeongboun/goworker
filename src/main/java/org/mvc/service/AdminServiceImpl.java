package org.mvc.service;

import java.util.List;

import org.mvc.bean.AdminDTO;
import org.mvc.mybatis.AdminMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Log4j
@Service
public class AdminServiceImpl implements AdminService{

	@Setter(onMethod_=@Autowired)
	private AdminMapper mapper;

	@Override
	public int count() {
		return mapper.count();
	}
	
	@Override
	public List<AdminDTO> getRecipeList(int startRow , int endRow) {
		log.info("getList----------------------------------------");
		return mapper.getRecipeList(startRow, endRow);
	}
	@Override
	public List<AdminDTO> getRecipeGoodList(int startRow , int endRow) {
		return mapper.getRecipeGoodList(startRow, endRow);
	}

	@Override
	public List<AdminDTO> getRecipeVisitList(int startRow , int endRow) {
		return mapper.getRecipeVisitList(startRow, endRow);
	}
	@Override
	public List<AdminDTO> getRecipeGoodListDesc(int startRow , int endRow) {
		return mapper.getRecipeGoodList(startRow, endRow);
	}

	@Override
	public List<AdminDTO> getRecipeVisitListDesc(int startRow , int endRow) {
		return mapper.getRecipeVisitList(startRow, endRow);
	}
	
	@Override
	public int adminDelete(int num) {
		
		return mapper.adminDelete(num);
	}

	@Override
	public int adminUnDelete(int num) {
		
		return mapper.adminUnDelete(num);
	}

	@Override
	public int getKoreaCount(AdminDTO dto) {
		
		return mapper.getKoreaCount(dto);
	}
	@Override
	public int getUsaCount(AdminDTO dto) {
		return mapper.getUsaCount(dto);
	}
	@Override
	public int getJapanCount(AdminDTO dto) {
		return mapper.getJapanCount(dto);
	}
	@Override
	public int getChinaCount(AdminDTO dto) {
		return mapper.getChinaCount(dto);
	}
	@Override
	public int getMexicoCount(AdminDTO dto) {
		return mapper.getMexicoCount(dto);
	}
	@Override
	public int getItalyCount(AdminDTO dto) {
		return mapper.getItalyCount(dto);
	}
	@Override
	public int getVitnamCount(AdminDTO dto) {
		return mapper.getVitnamCount(dto);
	}


}
