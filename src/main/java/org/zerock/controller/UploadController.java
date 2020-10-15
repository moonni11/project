package org.zerock.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.zerock.domain.AttachFileDTO;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j

public class UploadController {
	
	@GetMapping("/uploadForm")
	public void uploadForm() {
		log.info("upload form");
	}
	
	@GetMapping("/uploadAjax")
	public void uploadAjax() {
		log.info("upload ajax");
	}
	
	@PostMapping("/uploadFormAction")
	public void uploadFormPost(MultipartFile[] uploadFile,Model model) {
		
		String uploadFolder = "C:\\Users\\1\\eclipse-workspace\\Gallery\\src\\main\\webapp\\resources\\image";
		
		for(MultipartFile multipartFile : uploadFile) {
			
			log.info("-------------------");
			log.info("Upload File Name: " +multipartFile.getOriginalFilename());
			log.info("Upload File Size: "+multipartFile.getSize());
		
		
			File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());
			
			try {
				multipartFile.transferTo(saveFile);
			}catch(Exception e) {
				log.error(e.getMessage());
				
			}
		}
	
	}
	
	private boolean checkImageType(File file) {
		
		try {
			String contentType = Files.probeContentType(file.toPath());
			
			return contentType.startsWith("image");
		}catch(IOException e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	//////////////////////////////////////////////////////////////////////
	
	@PostMapping(value = "/uploadAjaxAction", produces = MediaType.
			APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	// 9-19 수정
	public ResponseEntity<List<AttachFileDTO>>
	//public ResponseEntity<List<ArtVO>>
	uploadAjaxPost(MultipartFile[] uploadFile) {

		//9-19 수정
		List<AttachFileDTO> list = new ArrayList<>();
		//List<ArtVO> list = new ArrayList<>();
		String uploadFolder = "C:\\Users\\1\\eclipse-workspace\\Gallery\\src\\main\\webapp\\resources\\image";
		
		//String uploadFolderPath = getFolder();		
		File uploadPath = new File(uploadFolder);

		for (MultipartFile multipartFile : uploadFile) {
			//9-19 수정
			AttachFileDTO attachDTO = new AttachFileDTO();
			//ArtVO artVO = new ArtVO();
			
			String uploadFileName = multipartFile.getOriginalFilename();

			//IE has file path
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			
			//9-19 수정
			attachDTO.setFileName(uploadFileName);	
			//artVO.setImage(uploadFileName);

			try {
				File saveFile = new File(uploadPath, uploadFileName);							
				multipartFile.transferTo(saveFile);
				
				
				// check image type file
				if (checkImageType(saveFile)) {
					
					attachDTO.setImage(true);

					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));

					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);

					thumbnail.close();
				}
				
				// add to List
				// 9-19 수정
				list.add(attachDTO);
				//list.add(artVO);
				
			} catch (Exception e) {
				e.printStackTrace();
			} //end catch

		} //end for
		return new ResponseEntity<>(list, HttpStatus.OK);

	}
	
//////////////////////////////////////////////////////////////////
	//UploadController에서 섬네일 데이터 전송하기
	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName) {

		log.info("fileName: " + fileName);

		File file = new File("C:\\Users\\1\\eclipse-workspace\\Gallery\\src\\main\\webapp\\resources\\image\\" + fileName);

		log.info("file: " + file);

		ResponseEntity<byte[]> result = null;

		try {
			HttpHeaders header = new HttpHeaders();

			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file),
					header, HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;			
	}
	///////////////////////////////////////////////////////////////////////
	@PostMapping("/deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName, String type) {
		
		log.info("deleteFile: " + fileName);
		
		File file;
		
		try {
			file = new File("C:\\Users\\1\\eclipse-workspace\\Gallery\\src\\main\\webapp\\resources\\image\\" + URLDecoder.decode(fileName, "UTF-8"));
			
			file.delete();
			
			if (type.equals("image")) {
				
				String largeFileName = file.getAbsolutePath().replace("s_", "");
				
				log.info("largeFileName: " + largeFileName);
				
				file = new File(largeFileName);
				
				file.delete();
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
}	
