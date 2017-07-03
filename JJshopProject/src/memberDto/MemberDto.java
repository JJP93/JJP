package memberDto;

public class MemberDto {
String userName;
String userID;
String userPW;
String userEmail;
String userGender;
String addr;
public MemberDto() {
	// TODO Auto-generated constructor stub
}
public MemberDto(String userName, String userID, String userPW, String userEmail, String userGender, String addr) {
	super();
	this.userName = userName;
	this.userID = userID;
	this.userPW = userPW;
	this.userEmail = userEmail;
	this.userGender = userGender;
	this.addr = addr;
}
public String getUserName() {
	return userName;
}
public void setUserName(String userName) {
	this.userName = userName;
}
public String getUserID() {
	return userID;
}
public void setUserID(String userID) {
	this.userID = userID;
}
public String getUserPW() {
	return userPW;
}
public void setUserPW(String userPW) {
	this.userPW = userPW;
}
public String getUserEmail() {
	return userEmail;
}
public void setUserEmail(String userEmail) {
	this.userEmail = userEmail;
}
public String getUserGender() {
	return userGender;
}
public void setUserGender(String userGender) {
	this.userGender = userGender;
}
public String getAddr() {
	return addr;
}
public void setAddr(String addr) {
	this.addr = addr;
}




}
