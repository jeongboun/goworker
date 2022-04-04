package org.mvc.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mvc.bean.AdsDTO;
import org.mvc.bean.RecipeDTO;

public interface AdsMapper {

	public int count();
	public List<AdsDTO> getAdsList(
			@Param("startRow")int startRow ,
			@Param("endRow") int endRow	
			);
	
	public int adsInsert(AdsDTO adsDTO);
	
	public int adsImgUpdate(AdsDTO adsDTO);
	
	public int getShow(AdsDTO adsDTO);
}
