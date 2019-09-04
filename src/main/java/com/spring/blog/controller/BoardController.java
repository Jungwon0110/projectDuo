package com.spring.blog.controller;

import java.io.File;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.spring.blog.dto.BoardDto;
import com.spring.blog.dto.FileDto;
import com.spring.blog.service.BoardService;

@Controller
public class BoardController {

	@Resource(name = "com.spring.blog.service.BoardService")
	@Autowired
	BoardService boardService;

	@RequestMapping("/noticeBoard") // 게시판 리스트 화면 호출
	private String boardList(Model model) throws Exception {
		model.addAttribute("list", boardService.boardListService());
		System.out.println(boardService.boardCount());
		return "notice/noticeBoard"; // 생성할 jsp
	}
	 
	@RequestMapping("/noticeInsert")
	public String noticeInsert() {
		return "notice/noticeInsert";
	}


	@RequestMapping("/noticeDetail/{boardNum}")
	private String boardDetail(@PathVariable int boardNum, Model model) throws Exception {
		model.addAttribute("detail", boardService.boardDetailService(boardNum));
		return "notice/noticeDetail";
	}

	@RequestMapping("/noticeInsertProc")
	private String boardInsertProc(HttpServletRequest request, @RequestPart MultipartFile files) throws Exception {

		BoardDto board = new BoardDto();
		FileDto file = new FileDto();

		board.setBoardTitle(request.getParameter("boardTitle"));
		board.setBoardContents(request.getParameter("boardContents"));
		board.setBoardAuthor(request.getParameter("boardAuthor"));

		if (files.isEmpty()) { // 업로드할 파일이 없을 시
			boardService.boardInsertService(board); // 게시글 insert
		} else {
			String fileName = files.getOriginalFilename();
			String fileNameExtension = FilenameUtils.getExtension(fileName).toLowerCase();
			File destinationFile;
			String destinationFileName;
			String fileUrl = "C:\\project\\projectDuo\\src\\main\\resources\\static\\uploadFile\\image\\";

			do {
				destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + fileNameExtension;
				destinationFile = new File(fileUrl + destinationFileName);
			} while (destinationFile.exists());

			destinationFile.getParentFile().mkdirs();
			files.transferTo(destinationFile);

			boardService.boardInsertService(board); // 게시글 insert

			file.setFileKategorie("board");
			file.setKategorieNum(board.getBoardNum());
			file.setFileName(destinationFileName);
			file.setFileOriName(fileName);
			file.setFileUrl(fileUrl);

			boardService.fileInsertService(file); // file insert
		}

		return "redirect:/noticeBoard";
	}

	@RequestMapping("/noticeUpdate/{boardNum}") // 게시글 수정폼 호출
	private String boardUpdateForm(@PathVariable int boardNum, Model model) throws Exception {

		model.addAttribute("detail", boardService.boardDetailService(boardNum));

		return "notice/noticeUpdate";
	}

	@RequestMapping(value = "/noticeUpdateProc", method = RequestMethod.POST)
	private String boardUpdateProc(HttpServletRequest request) throws Exception {

		BoardDto board = new BoardDto();
		board.setBoardTitle(request.getParameter("boardTitle"));
		board.setBoardContents(request.getParameter("boardContents"));
		board.setBoardNum(Integer.parseInt(request.getParameter("boardNum")));

		boardService.boardUpdateService(board);

		return "redirect:/noticeDetail/" + request.getParameter("boardNum");
	}

	@RequestMapping("/noticeDelete/{boardNum}")
	private String boardDelete(@PathVariable int boardNum) throws Exception {
		boardService.boardDeleteService(boardNum);
		return "redirect:/noticeBoard";
	}
}
