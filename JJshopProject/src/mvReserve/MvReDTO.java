package mvReserve;

public class MvReDTO {
	int resnum;
	String seatID;
	String mvName;
	String mvArea;
	String mvTime;
	String mvdate;
	String mvprice;
	String seatck;
	
	public MvReDTO() {
		// TODO Auto-generated constructor stub
	}

	public MvReDTO(int resnum, String seatID, String mvName, String mvArea, String mvTime, String mvdate,
			String mvprice) {
		super();
		this.resnum = resnum;
		this.seatID = seatID;
		this.mvName = mvName;
		this.mvArea = mvArea;
		this.mvTime = mvTime;
		this.mvdate = mvdate;
		this.mvprice = mvprice;

	}

	public int getResnum() {
		return resnum;
	}

	public void setResnum(int resnum) {
		this.resnum = resnum;
	}

	public String getSeatID() {
		return seatID;
	}

	public void setSeatID(String seatID) {
		this.seatID = seatID;
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

	public String getMvdate() {
		return mvdate;
	}

	public void setMvdate(String mvdate) {
		this.mvdate = mvdate;
	}

	public String getMvprice() {
		return mvprice;
	}

	public void setMvprice(String mvprice) {
		this.mvprice = mvprice;
	}

	
	
	
}


