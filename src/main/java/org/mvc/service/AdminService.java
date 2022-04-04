package org.mvc.service;

import java.util.List;

import org.mvc.bean.AdminDTO;

public interface AdminService {
	
	public int count();
	public List<AdminDTO> getRecipeList(int startRow, int endRow);
	public List<AdminDTO> getRecipeGoodList(int startRow, int endRow);
	public List<AdminDTO> getRecipeVisitList(int startRow, int endRow);
	public List<AdminDTO> getRecipeGoodListDesc(int startRow, int endRow);
	public List<AdminDTO> getRecipeVisitListDesc(int startRow, int endRow);
	
	public int adminDelete(int num);
	
	public int adminUnDelete(int num);
	
	public int getKoreaCount(AdminDTO dto);
	public int getUsaCount(AdminDTO dto);
	public int getJapanCount(AdminDTO dto);
	public int getChinaCount(AdminDTO dto);
	public int getMexicoCount(AdminDTO dto);
	public int getItalyCount(AdminDTO dto);
	public int getVitnamCount(AdminDTO dto);
	
}
