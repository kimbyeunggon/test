package kimbyeunggon.ums.service;

import java.util.List;

import kimbyeunggon.ums.dao.UserDao;
import kimbyeunggon.ums.domain.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserServiceImpl implements UserService{
	@Autowired private UserDao userDao;
	
	//회원 목록을 얻는다
	public List<User> listUsers(){
		return userDao.getUsers();
	}
	
	//회원 한명을 찾는다
	//return : 회원
	//param : 회원 번호
	public User findUser(int userNo){
		User user = null;
		for(User tmp:userDao.getUsers()){
			if(tmp.getUserNo()==userNo){
			user=tmp;
			break;
			}
		}
		return user;
	}
	
	//회원 한명을 추가한다
	//return : 추가 성공 여부
	//param : 회원명
	@Transactional
	public boolean join(String userName){
		return userDao.addUser(userName)>0;
	}
	
	//회원 수정한다
	//return : 수정 성공 여부
	//param : 수정할 회원	
	@Transactional
	public boolean fixUserInfo(User user){
		return userDao.updateUser(user)>0;
	}
	
	//회원 한명을 수정한다
	//return : 삭제 성공 여부
	//param : 수정할 회원명	
	@Transactional
	public boolean secede(int userNo){
		return userDao.delUser(userNo)>0;
	}
}
