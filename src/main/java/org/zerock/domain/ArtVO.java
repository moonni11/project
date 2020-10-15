package org.zerock.domain;

import java.util.List;

import lombok.Data;

@Data
public class ArtVO {
	
	private long ano;
	private String aname;
	private String artist;
	private long gno;	
	private String gname;
	private String image;
	
	private String menu;
	
	private List<ArtAttachVO> attachList;
	
	private String content;
}
