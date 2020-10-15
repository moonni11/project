package org.zerock.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@Log4j
public class GalleryControllerTests {
	@Setter(onMethod_ = {@Autowired})
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;
	
	@Before //매 실행전에 JUnit 으로 가상의 웹서버를 가동한다.
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
//	@Test
//	public void testList() throws Exception {
//		log.info(
//				mockMvc.perform(MockMvcRequestBuilders.get("/gallery/list")).andReturn().getModelAndView().getModelMap());
//	}
//	
//	@Test
//	public void testRegister() throws Exception {
//		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/gallery/register").param("gname", "테스트 새글 제목").param("tel", "테스트 새글 내용").param("address", "user00")
//				.param("mapurl", "values").param("pay","values").param("hours","values").param("route", "values")
//				.param("sns"," values").param("image1","1").param("image2","1").param("image3","1")
//				.param("image4","1")
//				.param("image5","1")
//				.param("image6","1")
//				.param("image7","1")
//				.param("image8","1")
//				.param("image9","1")
//				.param("image10","1")
//				).andReturn().getModelAndView().getViewName();
//		
//		log.info(resultPage);
//	}
//	
//	@Test
//	public void testGet() throws Exception {
//		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/gallery/get").param("gno", "21")).andReturn().getModelAndView().getModelMap());
//	}
//	
//	@Test
//	public void testModify() throws Exception {
//		
//		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/gallery/modify").param("gno", "29").param("gname", "목").param("tel", "수정된 테스트 새글 내용")
//				.param("address", "user00").param("mapurl", "values").param("pay","values").param("hours","values").param("route", "values")
//				.param("sns"," values").param("image1","1").param("image2","1").param("image3","1")
//				.param("image4","1")
//				.param("image5","1")
//				.param("image6","1")
//				.param("image7","1")
//				.param("image8","1")
//				.param("image9","1")
//				.param("image10","1")
//				).andReturn().getModelAndView().getViewName();
//	}
//	
//	@Test
//	public void testRemove() throws Exception{
//		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/gallery/remove").param("gno", "33")).andReturn().getModelAndView().getViewName();
//		
//		log.info(resultPage);
//	}
	
//	@Test
//	public void testListPaging() throws Exception{
//		log.info(mockMvc.perform(
//				MockMvcRequestBuilders.get("/gallery/list")
//				.param("pageNum", "2")
//				.param("amount", "50"))
//				.andReturn().getModelAndView().getModelMap());
//	}
	
}
