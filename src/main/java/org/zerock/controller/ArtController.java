package org.zerock.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PostAuthorize;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.ArtAttachVO;
import org.zerock.domain.ArtVO;

import org.zerock.domain.Criteria;
import org.zerock.domain.PageDTO;
import org.zerock.service.ArtService;



import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/art/*")
@AllArgsConstructor
public class ArtController {
	private ArtService service;
	
//	@GetMapping("/list") //테이블 내용용 전체 출력
//	public void list(Model model) {
//		log.info("list");
//		model.addAttribute("list",service.getList());
//	}
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		log.info("list: " + cri);
		model.addAttribute("list", service.getList(cri));
		int total = service.getTotal(cri);
		log.info("total: " + total);
		model.addAttribute("pageMaker",new PageDTO(cri, total));
	}
	
//	@GetMapping("/list2")
//	public void list1(Criteria cri, Model model) throws IOException {
//		log.info("list: " + cri);
//		model.addAttribute("list", service.getList(cri));
//		int total = service.getTotal(cri);
//		log.info("total: " + total);
//		model.addAttribute("pageMaker",new PageDTO(cri, total));
//		
//		
//		String WeatherURL = "https://weather.naver.com/today";
//		Document doc = Jsoup.connect(WeatherURL).get();
//		Elements elem = doc.select(".weather_area .summary  .weather");
//		String[] str = elem.text().split(" ");
//		model.addAttribute("weather", elem);
//		System.out.println(elem);
//
//	    model.addAttribute("test1", elem);
//	    
//	}
	
	@PostMapping("/register")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public String register(ArtVO art, RedirectAttributes rttr) {
		log.info("register: " + art);
		
		service.register(art);
		
		rttr.addFlashAttribute("result", art.getAno()); //모달창을 위한 처리 addflashAttribute 한번 사용하면 없어진다.그 값이 없어진다.
		
		return "redirect:/art/list";
	}
	
	@GetMapping({"/get", "/modify"}) //게시물 조회 
	public void get(@RequestParam("ano") Long ano, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("/get or modify");
		model.addAttribute("art", service.get(ano));
	}
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping("/modify")
	public String modify(ArtVO art, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("modify: " + art);
		
		if(service.modify(art)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/art/list";
	}
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping("/remove")
	public String remove(@RequestParam("ano") Long ano, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr,String writer) {
		log.info("remove..." + ano);
		
		List<ArtAttachVO> attachList = service.getAttachList(ano);
		
		if(service.remove(ano)) {
			
			//delete Attach Files
			deleteFiles(attachList);
			
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/art/list" + cri.getListLink();
	}
	
	@GetMapping("/register") //단순히 화면만 호출해주는 메소드
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public void register() {
		
	}
	
private void deleteFiles(List<ArtAttachVO> attachList) {
		
		if (attachList == null || attachList.size()==0) {
			return;
		}
		
		log.info("delete attach files.........");
		log.info(attachList);
		
		attachList.forEach(attach ->{
			try {
				Path file = Paths.get("C:\\Users\\EZ\\eclipse-workspace\\EZgal2\\src\\main\\webapp\\resources\\image\\"+attach.getFileName());
				
				Files.deleteIfExists(file);
				
				if(Files.probeContentType(file).startsWith("image")) {
					
					Path thumbNail = Paths.get("C:\\Users\\EZ\\eclipse-workspace\\EZgal2\\src\\main\\webapp\\resources\\image\\"+"s_"+attach.getFileName());
					
					Files.delete(thumbNail);
				}
			}catch(Exception e) {
				log.error("delete file error"+e.getMessage());
			}//end catch
		});//end foreachd
	}
}
