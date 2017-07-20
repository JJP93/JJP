package mvSeat;

public class SeatDTO {
int rnum;
int cnum;
int ck;
String seatnum;

public SeatDTO() {
	// TODO Auto-generated constructor stub
}

public SeatDTO(int rnum, int cnum, int ck, String seatnum) {
	super();
	this.rnum = rnum;
	this.cnum = cnum;
	this.ck = ck;
	this.seatnum = seatnum;
}

public int getRnum() {
	return rnum;
}

public void setRnum(int rnum) {
	this.rnum = rnum;
}

public int getCnum() {
	return cnum;
}

public void setCnum(int cnum) {
	this.cnum = cnum;
}

public int getCk() {
	return ck;
}

public void setCk(int ck) {
	this.ck = ck;
}

public String getSeatnum() {
	return seatnum;
}

public void setSeatnum(String seatnum) {
	this.seatnum = seatnum;
}


}
