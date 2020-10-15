package org.zerock.domain;

import java.util.List;

import lombok.Data;

@Data
public class GalleryVO {
	private long gno;
	private String gname;
	private String tel;
	private String address;
	private String mapurl;
	private String pay;
	private String hours;
	private String route;
	private String sns;
	private String image1;
	
	private List<GalleryAttachVO> attachList;
}

