package com.model2.mvc.web.user;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.user.UserService;


//==> ȸ������ RestController
@RestController
@RequestMapping("/user/*")
public class UserRestController {
	
	///Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	//setter Method ���� ����
		
	public UserRestController(){
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	//get
	@RequestMapping( value="json/getUser/{userId}", method=RequestMethod.GET )
	public User getUser( @PathVariable String userId ) throws Exception{
		
		System.out.println("/user/json/getUser : GET");
		
		//Business Logic
		return userService.getUser(userId);
	}

	
	//login
	@RequestMapping( value="json/login", method=RequestMethod.POST )
	public User login(	@RequestBody User user,
									HttpSession session ) throws Exception{
	
		System.out.println("/user/json/login : POST");
		//Business Logic
		System.out.println("::"+user);
		User dbUser=userService.getUser(user.getUserId());
		
		if( user.getPassword().equals(dbUser.getPassword())){
			session.setAttribute("user", dbUser);
		}
		
		return dbUser;
	}
	
	
	
	//addUser
	@RequestMapping( value="json/addUser", method=RequestMethod.POST )
	public User addUser( @RequestBody User user ) throws Exception {

		System.out.println("/user/addUser : POST");
		//Business Logic
		userService.addUser(user);
		
		return userService.getUser(user.getUserId());
	}
	
	//updateUser
	@RequestMapping(value = "json/updateUser/{userId}", method=RequestMethod.GET)
	public User updateUser( @PathVariable String userId ) throws Exception{
		
		System.out.println("/user/updateUser : GET");
		
		User user = userService.getUser(userId);
		
		return user;
		
	}
	
	@RequestMapping(value="json/updateUser", method=RequestMethod.POST)
	public User updateUser( @RequestBody User user, HttpSession session) throws Exception{
		
		System.out.println("/user/updateUser : POST");
		
		userService.updateUser(user);
		
		return userService.getUser(user.getUserId());
	}
	
	
	//listUser
	@RequestMapping(value="json/listUser")
	public Map<String ,Object> listUser(@RequestBody Search search) throws Exception {
		
		System.out.println(":: /user/listUser ::");

		if(search.getCurrentPage()==0) {
			search.setCurrentPage(-1);
		}
		search.setPageSize(pageSize);
		
		Map<String,Object> map = userService.getUserList(search);
		
		Page resultPage = new Page(search.getCurrentPage(), 
				((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		return map;
		
	}
	
}
	