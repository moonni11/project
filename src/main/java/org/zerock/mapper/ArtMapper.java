package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.ArtVO;
//import org.apache.ibatis.annotations.Select;

import org.zerock.domain.Criteria;

public interface ArtMapper {
	
	//@Select("select * from tbl_board where bno > 0")
	public List<ArtVO> getList();
	
	public List<ArtVO> getListWithPaging(Criteria cri);
	
	public void insert(ArtVO art);

	public Integer insertSelectKey(ArtVO art);
	
	public ArtVO read(Long ano);

	public int delete(Long ano);

	public int update(ArtVO art);

	public int getTotalCount(Criteria cri);
	
	//public List<ArtVO> getOldFiles();
}
