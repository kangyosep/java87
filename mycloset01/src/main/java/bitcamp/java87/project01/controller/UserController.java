package bitcamp.java87.project01.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import bitcamp.java87.project01.domain.Page;
import bitcamp.java87.project01.domain.Search;
import bitcamp.java87.project01.domain.User;
import bitcamp.java87.project01.service.UserService;


@Controller
@RequestMapping("/user/*")
public class UserController {
	
	///Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
		
	public UserController(){
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	
	//@RequestMapping("/addUserView.do")
	//public String addUserView() throws Exception {
	@RequestMapping( value="addUser", method=RequestMethod.GET )
	public String addUser() throws Exception{
	
		System.out.println("/user/addUser : GET");
		
		return "redirect:/user/addUserView.jsp";
	}
	
	//@RequestMapping("/addUser.do")
	@RequestMapping( value="addUser", method=RequestMethod.POST )
	public String addUser( @ModelAttribute("user") User user,HttpSession session) throws Exception {

		System.out.println("/user/addUser : POST");
		//Business Logic
		userService.addUser(user);
		if(user !=null){
		  session.setAttribute("user", user);
		}
		return "redirect:/main/cardList.jsp";
	}
	
	//@RequestMapping("/getUser.do")
	@RequestMapping( value="getUser", method=RequestMethod.GET )
	public String getUser( @RequestParam("userId") String userId , Model model ) throws Exception {
		
		System.out.println("/user/getUser : GET");
		//Business Logic
		User user = userService.getUser(userId);
		model.addAttribute("user", user);
		
		return "forward:/user/getUser.jsp";
	}
	
	//@RequestMapping("/updateUserView.do")
	//public String updateUserView( @RequestParam("userId") String userId , Model model ) throws Exception{
	@RequestMapping( value="updateUser", method=RequestMethod.GET )
	public String updateUser( @RequestParam("userId") String userId , Model model ) throws Exception{

		System.out.println("/user/updateUser : GET");
		//Business Logic
		User user = userService.getUser(userId);
		model.addAttribute("user", user);
		
		return "forward:/user/updateUser.jsp";
	}
	
	//@RequestMapping("/updateUser.do")
/*	@RequestMapping( value="updateUser", method=RequestMethod.POST )
	public String updateUser( @ModelAttribute("user") User user , Model model , HttpSession session) throws Exception{

		System.out.println("/user/updateUser : POST");
		//Business Logic
		userService.updateUser(user);
		
		String sessionId=((User)session.getAttribute("user")).getUserId();
		if(sessionId.equals(user.getUserId())){
			session.setAttribute("user", user);
		}
		
		//return "redirect:/getUser.do?userId="+user.getUserId();
		return "redirect:/user/getUser?userId="+user.getUserId();
	}*/
	
	//@RequestMapping("/loginView.do")
	//public String loginView() throws Exception{
	@RequestMapping( value="login", method=RequestMethod.GET )
	public String login( @RequestParam("email") String email , @RequestParam("name") String name) throws Exception{
		
		System.out.println("/user/logon : GET");
		System.out.println("이메일:"+email);
		System.out.println("이름:"+name);
		return "redirect:/index.jsp";
	}
	
	//@RequestMapping("/login.do")
	/*@RequestMapping( value="login", method=RequestMethod.POST )
	public String login(@ModelAttribute("user") User user  ,Model model ,HttpSession session) throws Exception{
		
		System.out.println("여기 userController:/user/login : POST");
		//Business Logic
		 
		if( userService.getUser(user.getEmail()) != null && userService.getUser(user.getEmail()).getPwd().equals(user.getPwd()) ){
		  model.addAttribute("user",  userService.getUser(user.getEmail()));
		  session.setAttribute("user", user);
		  return "redirect:/index.jsp";
		}
		
    model.addAttribute( "userLogin", userService.getUser(user.getEmail()));
		return "redirect:/front.jsp";
		
	}*/
	@RequestMapping( value="login", method=RequestMethod.POST )
  public @ResponseBody User login(String email, String pwd, HttpSession session) throws Exception{
	  
	  User user=userService.getUser(email);
	 	  
	    if(user.getPwd().trim().equals(pwd.trim())){
	      System.out.println("세션");
  	     session.setAttribute("user",user);
	    }
	  return user; 
	}
	
	@RequestMapping( value="fbLogin", method=RequestMethod.POST )
  public @ResponseBody User fbLogin(String email ,HttpSession session) throws Exception{
    System.out.println("email:"+email);
	  User user=userService.getUser(email);
   System.out.println("로그인 세션만들기");
   
    if(user != null){
      session.setAttribute("user",user);
    }
    return user; 
  }
	
	@RequestMapping( value="fbaddUser", method=RequestMethod.POST )
  public @ResponseBody void fbaddUser(String nick,String email, String pwd, String phot_path, HttpSession session) throws Exception{
	  User user = new User();
	  user.setNick(nick);
	  user.setEmail(email);
	  user.setPwd(pwd);
	  user.setPhot_path(phot_path);
	  
    System.out.println("add세션만들기"+user);
    userService.addUser(user);
   
    if(user != null){
      session.setAttribute("user",user);
    }
 }
	
	//@RequestMapping("/logout.do")
	@RequestMapping( value="logout", method=RequestMethod.GET )
	public String logout(HttpSession session ) throws Exception{
		
		System.out.println("/user/logout : POST");
		
		session.invalidate();
		
		return "redirect:../index.jsp";
	}
	
	
	//@RequestMapping("/checkDuplication.do")
	@RequestMapping( value="checkDuplication", method=RequestMethod.POST )
	public String checkDuplication( @RequestParam("email") String email , Model model ) throws Exception{
		
		System.out.println("여기 유저컨트롤러"+"/user/checkDuplication : POST");
		//Business Logic
		boolean result=userService.checkDuplication(email);
		model.addAttribute("result", new Boolean(result));
		model.addAttribute("email", email);

		return "forward:/user/checkDuplication.jsp";
	}
	
	//@RequestMapping("/listUser.do")
	@RequestMapping( value="listUser" )
	public String listUser( @ModelAttribute("search") Search search , Model model , HttpServletRequest request) throws Exception{
		
		System.out.println("/user/listUser : GET / POST");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String , Object> map=userService.getUserList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/user/listUser.jsp";
	}
}