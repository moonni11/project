package org.zerock.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

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
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.GalleryAttachVO;
import org.zerock.domain.GalleryVO;
import org.zerock.domain.PageDTO;
import org.zerock.service.BoardService;
import org.zerock.service.GalleryService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/gallery/*")
@AllArgsConstructor
public class GalleryController {
	private GalleryService service;
	
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
	
	
	
	
	@PostMapping("/register")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public String register(GalleryVO gallery, RedirectAttributes rttr) {
		log.info("register: " + gallery);
		
		service.register(gallery);
		
		rttr.addFlashAttribute("result", gallery.getGno()); //모달창을 위한 처리 addflashAttribute 한번 사용하면 없어진다.그 값이 없어진다.
		
		return "redirect:/gallery/list";
	}
	
	
	@GetMapping({"/get", "/modify"}) //게시물 조회 
	public void get(@RequestParam("gno") Long gno, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("/get or modify");
		model.addAttribute("gallery", service.get(gno));
		model.addAttribute("list2",service.getList2(gno));
	}
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping("/modify")
	public String modify(GalleryVO gallery, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("modify: " + gallery);
		
		if(service.modify(gallery)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/gallery/list";
	}
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping("/remove")
	public String remove(@RequestParam("gno") Long gno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("remove..." + gno);
		
		List<GalleryAttachVO> attachList = service.getAttachList(gno);
		
		if(service.remove(gno)) {
			//delete Attach Files
			deleteFiles(attachList);
			
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/gallery/list" + cri.getListLink();
	}
	
	@GetMapping("/register") //단순히 화면만 호출해주는 메소드
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public void register() {
		
	}
	
private void deleteFiles(List<GalleryAttachVO> attachList) {
		
		if (attachList == null || attachList.size()==0) {
			return;
		}
		
		log.info("delete attach files.........");
		log.info(attachList);
		
		attachList.forEach(attach ->{
			try {
				Path file = Paths.get("Z:\\화면설계_구현\\이유정\\spring_web\\EZGallery2\\src\\main\\webapp\\resources\\image\\"+attach.getFileName());
				
				Files.deleteIfExists(file);
				
				if(Files.probeContentType(file).startsWith("image")) {
					
					Path thumbNail = Paths.get("Z:\\화면설계_구현\\이유정\\spring_web\\EZGallery2\\src\\main\\webapp\\resources\\image\\"+"s_"+attach.getFileName());
					
					Files.delete(thumbNail);
				}
			}catch(Exception e) {
				log.error("delete file error"+e.getMessage());
			}//end catch
		});//end foreachd
	}
}
