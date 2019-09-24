package com.spring.blog.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
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

	@RequestMapping(value = "/noticeBoard", method = {RequestMethod.GET, RequestMethod.POST}) // 게시판 리스트 화면 호출
	private String boardList(Model model) throws Exception {
		model.addAttribute("list", boardService.boardListService());
		System.out.println(boardService.boardCount());
		return "notice/noticeBoard"; // 생성할 jsp
	}

	@RequestMapping(value = "/noticeInsert", method = RequestMethod.GET)
	public String noticeInsert() {
		return "notice/noticeInsert";
	}

	@RequestMapping(value = "/noticeDetail/{boardNum}", method = RequestMethod.GET)
	private String boardDetail(@PathVariable int boardNum, Model model) throws Exception {
		model.addAttribute("detail", boardService.boardDetailService(boardNum));
		model.addAttribute("files", boardService.fileDetailService(boardNum)); // 추가
		return "notice/noticeDetail";
	}

	@Value("${file.upload.directory}")
	String uploadFileDir;

	@RequestMapping(value = "/noticeInsertProc", method = RequestMethod.POST)
	private String boardInsertProc(HttpServletRequest request, @RequestPart MultipartFile files) throws Exception {

		BoardDto board = new BoardDto();
		FileDto file = new FileDto();

		board.setBoardTitle(request.getParameter("boardTitle"));
		board.setBoardContents(request.getParameter("boardContents"));
		board.setBoardAuthor(request.getParameter("boardAuthor"));
		board.setKategorie(request.getParameter("kategorie"));

		if (files.isEmpty()) { // 업로드할 파일이 없을 시
			boardService.boardInsertService(board); // 게시글 insert
		} else {
			String fileName = files.getOriginalFilename();
			String fileNameExtension = FilenameUtils.getExtension(fileName).toLowerCase();
			File destinationFile;
			String destinationFileName;
			String fileUrl = "C:\\\\project\\\\projectDuo\\\\src\\\\main\\\\resources\\\\static\\\\uploadFile\\\\image\\\\";
			
			do {
				destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + fileNameExtension;
				destinationFile = new File(fileUrl + destinationFileName);
			} while (destinationFile.exists());

			destinationFile.getParentFile().mkdirs();
			files.transferTo(destinationFile);

			boardService.boardInsertService(board); // 게시글 insert

			file.setFileKategorie(request.getParameter("kategorie"));
			file.setKategorieNum(board.getBoardNum());
			file.setFileName(destinationFileName);
			file.setFileOriName(fileName);
			file.setFileUrl(fileUrl);

			boardService.fileInsertService(file); // file insert
		}

		return "redirect:/noticeBoard";
	}

	@RequestMapping(value ="/noticeUpdate/{boardNum}", method = RequestMethod.GET) // 게시글 수정폼 호출
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

	@RequestMapping(value = "/noticeDelete/{boardNum}", method = RequestMethod.POST)
	private String boardDelete(@PathVariable int boardNum) throws Exception {
		boardService.boardDeleteService(boardNum);
		boardService.fileDeleteService(boardNum);
		return "redirect:/noticeBoard";
	}

	@RequestMapping(value = "/fileDown/{boardNum}", method = RequestMethod.POST)
    private void fileDown(@PathVariable int boardNum, HttpServletRequest request, HttpServletResponse response) throws Exception{
        
        request.setCharacterEncoding("UTF-8");
        FileDto fileDto = boardService.fileDetailService(boardNum);
        
        //파일 업로드된 경로 
        try{
            String fileUrl = fileDto.getFileUrl();
            fileUrl += "/";
            String savePath = fileUrl;
            String fileName = fileDto.getFileName();
            
            //실제 내보낼 파일명 
            String oriFileName = fileDto.getFileOriName();
            InputStream in = null;
            OutputStream os = null;
            File file = null;
            boolean skip = false;
            String client = "";
            
            //파일을 읽어 스트림에 담기  
            try{
                file = new File(savePath, fileName);
                in = new FileInputStream(file);
            } catch (FileNotFoundException fe) {
                skip = true;
            }
            
            client = request.getHeader("User-Agent");
            
            //파일 다운로드 헤더 지정 
            response.reset();
            response.setContentType("application/octet-stream");
            response.setHeader("Content-Description", "JSP Generated Data");
            
            if (!skip) {
                // IE
                if (client.indexOf("MSIE") != -1) {
                    response.setHeader("Content-Disposition", "attachment; filename=\""
                            + java.net.URLEncoder.encode(oriFileName, "UTF-8").replaceAll("\\+", "\\ ") + "\"");
                    // IE 11 이상.
                } else if (client.indexOf("Trident") != -1) {
                    response.setHeader("Content-Disposition", "attachment; filename=\""
                            + java.net.URLEncoder.encode(oriFileName, "UTF-8").replaceAll("\\+", "\\ ") + "\"");
                } else {
                    // 한글 파일명 처리
                    response.setHeader("Content-Disposition",
                            "attachment; filename=\"" + new String(oriFileName.getBytes("UTF-8"), "ISO8859_1") + "\"");
                    response.setHeader("Content-Type", "application/octet-stream; charset=utf-8");
                }
                response.setHeader("Content-Length", "" + file.length());
                os = response.getOutputStream();
                byte b[] = new byte[(int) file.length()];
                int leng = 0;
                while ((leng = in.read(b)) > 0) {
                    os.write(b, 0, leng);
                }
            } else {
                response.setContentType("text/html;charset=UTF-8");
                System.out.println("<script language='javascript'>alert('파일을 찾을 수 없습니다');history.back();</script>");
            }
            in.close();
            os.close();
        } catch (Exception e) {
            System.out.println("ERROR : " + e.getMessage());
        }
        
    }


}
