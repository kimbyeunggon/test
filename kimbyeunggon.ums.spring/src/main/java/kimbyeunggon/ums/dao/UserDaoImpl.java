package kimbyeunggon.ums.dao;

import java.util.List;

import kimbyeunggon.ums.dao.mapper.UserMapper;
import kimbyeunggon.ums.domain.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class UserDaoImpl {
	@Autowired private UserMapper userMapper;
	
	//회원 목록을 얻는다
	//return : 회원목록
	public List<User> getUsers(){
		return userMapper.getUsers();
	}
	
	//회원 한명을 찾는다
	//return :회원 한명
	//param: 회원 번호
	public User getUser(int userNo){
		return userMapper.getUser(userNo);
	}
	
	public int addUser(String userName){
		return userMapper.addUser(userName);
	}
	
	//회원 정보를 수정한다
	//return :수정한 회원수
	//param:수정할 회원
	public int updateUser(User user){
		return userMapper.updateUser(user);
	}
	
	//회원을 삭제한다
	//return:삭제한 회원수
	//param:삭제할 회원번호
	public int delUser(int userNo){
		return userMapper.delUser(userNo);
	}
}
