package org.mvc.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mvc.bean.AdminDTO;

public interface AdminMapper {
	
	public int count();
	public List<AdminDTO>	getRecipeList(
		@Param("startRow")int startRow ,
		@Param("endRow") int endRow);
	public List<AdminDTO> getRecipeGoodList(
		@Param("startRow")int startRow ,
		@Param("endRow") int endRow);
	public List<AdminDTO> getRecipeVisitList(
		@Param("startRow")int startRow ,
		@Param("endRow") int endRow);
	public List<AdminDTO> getRecipeGoodListDesc(
			@Param("startRow")int startRow ,
			@Param("endRow") int endRow);
		public List<AdminDTO> getRecipeVisitListDesc(
			@Param("startRow")int startRow ,
			@Param("endRow") int endRow);
		
	public int adminDelete(int num);
	
	public int adminUnDelete(int num);
	
	public int getKoreaCount(AdminDTO dto);
	public int getUsaCount(AdminDTO dto);
	public int getJapanCount(AdminDTO dto);
	public int getChinaCount(AdminDTO dto);
	public int getVitnamCount(AdminDTO dto);
	public int getMexicoCount(AdminDTO dto);
	public int getItalyCount(AdminDTO dto);
}
