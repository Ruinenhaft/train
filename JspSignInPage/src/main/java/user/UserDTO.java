package user;

//DTO(Data Transfer Object
//계층 간 데이터 교환을 하기 위해 사용되는 객체.
//로직을 가지지 않은 순수한 데이터 객체이다.
public class UserDTO {
	String userID;
	String userPassword;
	String userName;
	
	public String getUserID() {
		return userID;
	}
	
	public void setUserID(String userID) {
		this.userID = userID;
	}
	
	public String getUserPassword() {
		return userPassword;
	}
	
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	
	public String getUserName() {
		return userName;
	}
	
	public void setUserName(String userName) {
		this.userName = userName;
	}
}
