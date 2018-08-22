package kimbyeunggon.ums.dao.mapper;

import java.util.List;

import kimbyeunggon.ums.domain.User;

public interface UserMapper {
	List<User>	getUsers();
	User getUser(int userNo);
	int addUser(String name);
	int updateUser(User user);
	int delUser(int userNo);
}
