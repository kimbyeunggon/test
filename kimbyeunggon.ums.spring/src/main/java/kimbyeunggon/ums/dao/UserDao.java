package kimbyeunggon.ums.dao;

import java.util.List;

import kimbyeunggon.ums.domain.User;

public interface UserDao {
	List<User> getUsers();
	User getUser(int userNo);
	int addUser(String userName);
	int updateUser(User user);
	int delUser(int userNo);
}
