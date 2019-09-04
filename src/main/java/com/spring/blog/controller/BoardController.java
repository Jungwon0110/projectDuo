package com.spring.blog.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.blog.dto.BoardDto;
import com.spring.blog.service.BoardService;

@Controller
public class BoardController {

	@Resource(name = "com.spring.blog.service.BoardService")
	@Autowired
	BoardService boardService;

	@RequestMapping("/notice") // 게시판 리스트 화면 호출
	private String boardList(Model model) throws Exception {
		model.addAttribute("list", boardService.boardListService());
		System.out.println(boardService.boardCount());
		return "notice"; // 생성할 jsp
	}

	@RequestMapping("/detail/{num}")
	private String boardDetail(@PathVariable int num, Model model) throws Exception {
		model.addAttribute("detail", boardService.boardDetailService(num));
		return "detail";
	}

	@RequestMapping(value = "/insertProc", method = RequestMethod.POST)
	private String boardInsertProc(HttpServletRequest request) throws Exception {

		BoardDto board = new BoardDto();

		board.setTitle(request.getParameter("title"));
		board.setContents(request.getParameter("contents"));
		board.setName(request.getParameter("name"));
		board.setKategorie(request.getParameter("kategorie"));
		boardService.boardInsertService(board);

		return "redirect:/notice";
	}

	@RequestMapping("/update/{num}") // 게시글 수정폼 호출
	private String boardUpdateForm(@PathVariable int num, Model model) throws Exception {

		model.addAttribute("detail", boardService.boardDetailService(num));

		return "update";
	}

	@RequestMapping(value = "/updateProc", method = RequestMethod.POST)
	private String boardUpdateProc(HttpServletRequest request) throws Exception {

		BoardDto board = new BoardDto();
		board.setTitle(request.getParameter("title"));
		board.setContents(request.getParameter("contents"));
		board.setNum(Integer.parseInt(request.getParameter("num")));

		boardService.boardUpdateService(board);

		return "redirect:/detail/" + request.getParameter("num");
	}

	@RequestMapping("/delete/{num}")
	private String boardDelete(@PathVariable int num) throws Exception {
		boardService.boardDeleteService(num);
		return "redirect:/notice";
	}

}
