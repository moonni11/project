package org.zerock.domain;

import lombok.Data;

@Data
public class ArtAttachVO {

	private String uploadPath;
	private String fileName;
	private boolean fileType;
	
	private Long ano;


}
