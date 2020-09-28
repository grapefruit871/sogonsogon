package com.kh.sogon.help.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.sogon.help.model.service.AnswerService;
import com.kh.sogon.help.model.vo.Answer;

@SessionAttributes({"loginMember"})
@Controller
@RequestMapping("/answer/*")
public class AnswerController {
	
	@Autowired
	private AnswerService answerService;
	   
	   
	   //글쓰기
	   @RequestMapping("helpwrite")
	   public String helpWriteForm() {
		   return "help/helpWrite";
	   }
	   
	   //답변 조회
	   @ResponseBody
	   @RequestMapping("selectAnswer/{helpNo}")
	   public String answerView(@PathVariable int helpNo) {
		   
		   
		   Answer answer = answerService.selectAnswer(helpNo);
		   
		   Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();

		   return gson.toJson(answer);	
		   
	   
	   }
	   
	   //답변 삽입
	   @ResponseBody
		@RequestMapping(value="insertAnswer/{helpNo}", produces = "application/text; charset= utf-8")
							//produces : 응답 데이터의 mime type, 문자인코딩 지정 속성
							// -> ajax 통신 시 한글로 된 String 을 리턴할 경우 줄 사용함.
		public String insertAnswer(@PathVariable int helpNo, Answer answer) {
			//reply 커맨드 객체를 이용하여 전달받은 이름, 댓글 내용을 한 객체에 저장
			// + boardNo도 reply 객체의 parentBoardNo에 저장
			answer.setParentHelpNo(helpNo);
		
			int result = answerService.insertAnswer(answer);
			
			String str = "답변 삽입";
			
			if(result > 0) {
				str += "성공";
			}else {
				str +="실패";
			} 
		
		return str;
		
		}
	   	
	  
}
