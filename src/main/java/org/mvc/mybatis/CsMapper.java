package org.mvc.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mvc.bean.CsDTO;

public interface CsMapper {
	
	public int getCountMyQNA(@Param("id") String id);
	public List<CsDTO> getMyQNA(@Param("id") String id,@Param("startNum") int startNum,@Param("endNum") int endNum);
	public int csWrite(CsDTO dto);
	public int csFileUpload(CsDTO dto);
	public CsDTO read(int num);
	public int readCountUpdate(int num);
	public int update(int num);
}
