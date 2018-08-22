package kimbyeunggon.ums.domain;

import java.sql.Date;

public class User {
	private int userNo; //회원번호 
	private String userName; //회원이름
	private Date regDate; //가입일
	
	public int getUserNo() {
		return userNo;
	}
	public String getUserName() {
		return userName;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
}
