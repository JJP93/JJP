package movie;

public class MovieInfoDto {
int mvNum;
String mvName;
String mvArea;
String mvTime;
String mvDir;
String mvG;
String mvAc;
String mvImg;
String mvDate;
String mvSeat;


public MovieInfoDto() {
	// TODO Auto-generated constructor stub
}


public MovieInfoDto(int mvNum, String mvName, String mvArea, String mvTime, String mvDir, String mvG, String mvAc,
		String mvImg, String mvDate, String mvSeat) {
	super();
	this.mvNum = mvNum;
	this.mvName = mvName;
	this.mvArea = mvArea;
	this.mvTime = mvTime;
	this.mvDir = mvDir;
	this.mvG = mvG;
	this.mvAc = mvAc;
	this.mvImg = mvImg;
	this.mvDate = mvDate;
	this.mvSeat = mvSeat;
	
	
}


public int getMvNum() {
	return mvNum;
}


public void setMvNum(int mvNum) {
	this.mvNum = mvNum;
}


public String getMvName() {
	return mvName;
}


public void setMvName(String mvName) {
	this.mvName = mvName;
}


public String getMvArea() {
	return mvArea;
}


public void setMvArea(String mvArea) {
	this.mvArea = mvArea;
}


public String getMvTime() {
	return mvTime;
}


public void setMvTime(String mvTime) {
	this.mvTime = mvTime;
}


public String getMvDir() {
	return mvDir;
}


public void setMvDir(String mvDir) {
	this.mvDir = mvDir;
}


public String getMvG() {
	return mvG;
}


public void setMvG(String mvG) {
	this.mvG = mvG;
}


public String getMvAc() {
	return mvAc;
}


public void setMvAc(String mvAc) {
	this.mvAc = mvAc;
}


public String getMvImg() {
	return mvImg;
}


public void setMvImg(String mvImg) {
	this.mvImg = mvImg;
}


public String getMvDate() {
	return mvDate;
}


public void setMvDate(String mvDate) {
	this.mvDate = mvDate;
}


public String getMvSeat() {
	return mvSeat;
}


public void setMvSeat(String mvSeat) {
	this.mvSeat = mvSeat;
}



}
