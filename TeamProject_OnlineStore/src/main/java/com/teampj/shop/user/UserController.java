package com.teampj.shop.user;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;


@Controller
@RequestMapping(value = "/user/**")
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private SqlSession sqlSession;

	ModelAndView mav = new ModelAndView();
	

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public ModelAndView main(Model model) {
		mav.setViewName("usermain");
		return mav;
	}

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public ModelAndView mainhome(Model model) {
		mav.setView(new RedirectView("/shop"));	//�떎瑜� 而⑦듃濡ㅻ윭濡� viewname
		return mav;
	}
	// 
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView home(Model model) {
		mav.setViewName("login");
		return mav;
	}
	@RequestMapping(value = "/loginCheck", method = RequestMethod.POST)
	public ModelAndView loginCheck(HttpServletRequest request, Model mo, RedirectAttributes red) {
		
		String userid = request.getParameter("userid");
		String userpw = request.getParameter("userpw");
        String nowtime =request.getParameter("nowtime");
        
		UserService ss = sqlSession.getMapper(UserService.class);
		String member = ss.login(userid, userpw);
		
		int loginchk = ss.loginCheck(userid, userpw);
		if (loginchk == 1) {
			
			if(member!=null)
			{
				HttpSession hs = request.getSession();
				hs.setAttribute("member", member);
				hs.setAttribute("loginstate", true);
				hs.setMaxInactiveInterval(20*60);
				mav.setViewName("redirect:/list/main");
			}
			
		} else {
			mav.setViewName("/shop/list/main");
		}
		
		return mav;
	}
	@RequestMapping(value = "/loginn", method = RequestMethod.GET)
	public ModelAndView loginn(Model model) {
		mav.setViewName("loginn");
		return mav;
	
}
	@RequestMapping(value = "/idCheck", method = RequestMethod.GET)
	public int idCheck(UserDTO dto, HttpServletRequest request) {

		UserService ss = sqlSession.getMapper(UserService.class);

		int cnt = ss.idCheck();

		return cnt;
	}
	@RequestMapping(value = "/loginnsave", method = RequestMethod.POST)
	public ModelAndView Userin(HttpServletRequest request, Model mo) {

		String userid = request.getParameter("userid");
		String userpw = request.getParameter("userpw");
		String uname = request.getParameter("uname");
		String uaddress1 = request.getParameter("uaddress1");		
		String uemail = request.getParameter("umail1")+"@"+request.getParameter("umail2");
		System.out.println(uemail+"회원가입");
		String umobile = request.getParameter("umobile");
		String uzlpcode1 = request.getParameter("uzlpcode1");
		
		UserService ss = sqlSession.getMapper(UserService.class);
		
		ss.userin(userid, userpw, uname,uaddress1, uemail, umobile,uzlpcode1);
		mav.setViewName("usermain");
		return mav;
		
	}
	
	@RequestMapping(value = "/UserUpdateView", method = RequestMethod.GET)
	public ModelAndView UserUpdate(Model model) {
		mav.setViewName("UserUpdateView");
		return mav;
	}
	@RequestMapping(value = "/UserUpdate", method = RequestMethod.POST)
	public ModelAndView UserUpdate(HttpServletRequest request, Model mo) {

		HttpSession hs = request.getSession();
		String userid = (String) hs.getAttribute("member");
		String userpw = request.getParameter("userpw");
		String uname = request.getParameter("uname");
		String uaddress1 = request.getParameter("uaddress1");
		String uaddress2 = request.getParameter("uaddress2");
		String uaddress3 = request.getParameter("uaddress3");
		String uemail = request.getParameter("umail1")+"@"+request.getParameter("umail2");
		String umobile = request.getParameter("umobile");
		String uzlpcode1 = request.getParameter("uzlpcode1");
		String uzlpcode2 = request.getParameter("uzlpcode2");
		String uzlpcode3 = request.getParameter("uzlpcode3");
		UserService ss = sqlSession.getMapper(UserService.class);
		
		ss.UserUpdate(userid, userpw, uname,uaddress1,uaddress2,uaddress3, uemail, umobile,uzlpcode1,uzlpcode2,uzlpcode3);
		mav.setViewName("usermain");
		return mav;
	}
	@RequestMapping(value = "/deleteView", method = RequestMethod.GET)
	public ModelAndView delete(Model model) {
		mav.setViewName("deleteView");
		return mav;
	}
	@RequestMapping(value = "/delete", method = RequestMethod.POST, produces = "application/text; charset=UTF-8")
	public ModelAndView delete(HttpServletRequest request, Model mo) {
		String userid = "user001";
		String userpw = request.getParameter("userpw");
		UserService sss = sqlSession.getMapper(UserService.class);
		sss.delete(userid, userpw);
		mav.setViewName("redirect:home");
		return mav;
	}
	//카카오 Rest API 키 접속
	@RequestMapping(value="/getKakaoAuthUrl")
	public @ResponseBody String getKakaoAuthUrl(HttpServletRequest request) {
		String reqUrl = 
				"https://kauth.kakao.com/oauth/authorize"
						+ "?client_id=21016d43242ea7b653bdff592c5086f9"
						+ "&redirect_uri=http://localhost:8686/shop/user/oauth_kakao"
						+ "&response_type=code";
		return reqUrl;
	}
	
	//카카오 연동정보 조회
	@RequestMapping(value="/oauth_kakao", produces = "application/text; charset=UTF-8")
	public ModelAndView oauthKakao(@RequestParam(value="code",required = false)String code,Model model) {
		System.out.println("카카오 연동정보 조회 code"+code);
		String access_Token = getAccessToken(code);
		System.out.println("카카오 연동정보 토큰"+access_Token);
		
		HashMap<String, Object> userInfo = getUserInfo(access_Token);
		System.out.println("카카오 유저정보 이메일"+userInfo.get("email"));
		System.out.println("카카오 유저정보 닉네임"+userInfo.get("nickname"));
		
		JSONObject kakaoInfo = new JSONObject(userInfo);
		model.addAttribute("kakaoInfo", kakaoInfo);
		mav.setViewName("redirect:/list/main");
		return mav;
	}
	
	//토큰발급
	public String getAccessToken(String authorize_code) {
		String access_Token="";
		String refresh_Token="";
		String reqURL="https://kauth.kakao.com/oauth/token";
		try {
			URL url = new URL(reqURL);
			HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();
			//URL 연결은 입출력에 사용 될 수 있고, POST 혹은 PUT 요청을 하려면 setDoOutput을 true로 설정해야함.
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
//			POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=21016d43242ea7b653bdff592c5086f9");  //본인이 발급받은 key
            sb.append("&redirect_uri=http://localhost:8686/shop/user/oauth_kakao");     // 본인이 설정해 놓은 경로
            sb.append("&code=" + authorize_code);
            bw.write(sb.toString());
            bw.flush();

            //    결과 코드가 200이라면 성공
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);

            //    요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);

            //    Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
            // JsonParser parser = new JsonParser();
            JsonElement element = JsonParser.parseString(result);

            access_Token = element.getAsJsonObject().get("access_token").getAsString();
            refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

            System.out.println("access_token : " + access_Token);
            System.out.println("refresh_token : " + refresh_Token);

            br.close();
            bw.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return access_Token;
	}
		//유저정보조회
		public HashMap<String, Object> getUserInfo (String access_Token) {

	        //    요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
	        HashMap<String, Object> userInfo = new HashMap<String, Object>();
	        String reqURL = "https://kapi.kakao.com/v2/user/me";
	        try {
	            URL url = new URL(reqURL);
	            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	            conn.setRequestMethod("GET");

	            //    요청에 필요한 Header에 포함될 내용
	            conn.setRequestProperty("Authorization", "Bearer " + access_Token);

	            int responseCode = conn.getResponseCode();
	            System.out.println("responseCode : " + responseCode);

	            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

	            String line = "";
	            String result = "";

	            while ((line = br.readLine()) != null) {
	                result += line;
	            }
	            System.out.println("response body : " + result);

	            // JSONParser parser = new JSONParser();
	            JsonElement element =JsonParser.parseString(result);

	            JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
	            JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

	            String nickname = properties.getAsJsonObject().get("nickname").getAsString();
	            String email = kakao_account.getAsJsonObject().get("email").getAsString();
	            
	            userInfo.put("accessToken", access_Token);
	            userInfo.put("nickname", nickname);
	            userInfo.put("email", email);
	            

	        } catch (IOException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }

	        return userInfo;
	    }
	
	
}