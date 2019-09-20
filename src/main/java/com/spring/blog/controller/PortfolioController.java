package com.spring.blog.controller;

import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.blog.dto.FileDto;
import com.spring.blog.dto.PortfolioDto;
import com.spring.blog.dto.TeamDto;
import com.spring.blog.service.PortfolioService;

@Controller
public class PortfolioController {

	@Resource(name = "com.spring.blog.service.PortfolioService")
	@Autowired
	PortfolioService portfolioService;

	@RequestMapping("/portfolio")
	public String portfolioList(Model model) throws Exception {
		model.addAttribute("list", portfolioService.portfolioListService());
		model.addAttribute("count", portfolioService.portfolioCount());
		System.out.println("portfolio Count : "+portfolioService.portfolioCount());
		return "portfolio";
	}

	@RequestMapping("/portfolioInsert")
	public void portfolioInsert() {
	}
	
	@RequestMapping("/portfolioFileInsertProc/{imgNum}")
	private String portfolioFileInsertProc(HttpServletRequest request, @PathVariable int imgNum) {
		int num=0;
		try {
			num=portfolioService.findPortfolioNum();
		} catch (Exception e) {
			e.printStackTrace();
		}
		FileDto fileDto = new FileDto();
		
		fileDto.setFileName(request.getParameter("photoName"));
		fileDto.setFileDescription(request.getParameter("photoDescription"));
		fileDto.setFileUrl(request.getParameter("my_image"));
		fileDto.setFileKategorie("portfolio");
		fileDto.setKategorieNum(num-1);
		
		portfolioService.portfolioFileInsertService(fileDto);
		return "redirect:/portfolio";
	}
	
	@RequestMapping("/addTeam/{member}")
	private String addTeam(HttpServletRequest request, @PathVariable String member) {
		int num=0;
		try {
			num=portfolioService.findPortfolioNum();
		} catch (Exception e) {
			e.printStackTrace();
		}
		TeamDto teamDto = new TeamDto();
		teamDto.setPortfolioNum(num-1);
		teamDto.setMember(member);
		
		portfolioService.addTeam(teamDto);
		
		return "redirect:/portfolio";
	}


	@RequestMapping("/portfolioInsertProc")
	private String portfolioInsertProc(HttpServletRequest request) throws Exception {
		
		PortfolioDto portfolioDto = new PortfolioDto(); 
		String st = request.getParameter("startTime");
		String et = request.getParameter("endTime");
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date startTime = transFormat.parse(st);
		Date endTime = transFormat.parse(et);
		
		portfolioDto.setPortfolioTitle(request.getParameter("portfolioTitle"));
		portfolioDto.setStartTime(startTime);
		portfolioDto.setEndTime(endTime);
		portfolioDto.setTeamName(request.getParameter("teamName"));
		portfolioDto.setMainImage(request.getParameter("mainImage"));
		portfolioDto.setLeader(request.getParameter("leader"));
		portfolioDto.setGithubRepo(request.getParameter("githubRepo"));
		portfolioDto.setPageUrl(request.getParameter("pageUrl"));
		portfolioDto.setYoutubeUrl(request.getParameter("youtubeUrl"));
		portfolioDto.setSummary(request.getParameter("summary"));
		portfolioDto.setVisible(Integer.parseInt(request.getParameter("visible")));
		
		
		System.out.println("portfolioInsertProc"+portfolioDto.toString());
		
		portfolioService.portfolioInsertService(portfolioDto);
		return "redirect:/portfolioInsert";
	}

}
