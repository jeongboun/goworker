package org.mvc.service;

import java.util.List;

import org.mvc.bean.NoticeDTO;

public interface NoticeService {



	public int noticeWrite(NoticeDTO noticeDTO);


	public List<NoticeDTO> getList(int startRow , int endRow);

//	public List<NoticeDTO> getList(@Param ("startRow") int startRow, @Param("endRow") int endRow);


	public int count();


	public int readUP(Long num);

	public NoticeDTO getContent(Long num);

	public int notice_del(Long num);

	public int notice_updatePro(NoticeDTO dto);





//	public JsonObject SummerNoteImageFile(MultipartFile file) {
//		JsonObject jsonObject = new JsonObject();
//		String fileRoot = "C:\\summernoteImg\\";
//		String originalFileName = file.getOriginalFilename();
//		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));
//
//		String saveFileName = UUID.randomUUID()+extension;
//
//		File targetFile = new File(fileRoot+saveFileName);
//
//		try {
//			InputStream fileStream = file.getInputStream();
//			FileUtils.copyInputStreamToFile(fileStream, targetFile);
//			jsonObject.addProperty("url", "/summernoteImg/"+saveFileName);
//			jsonObject.addProperty("responseCode", "succcess");
//		} catch(IOException e) {
//			FileUtils.deleteQuietly(targetFile);
//			jsonObject.addProperty("responseCode", "error");
//			e.printStackTrace();
//		}
//		return jsonObject;
//	}



	}
