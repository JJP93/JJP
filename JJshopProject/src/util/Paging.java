package util;

public class Paging {

	int startRow;
	int perPageNum;
	int pageNum;
	
	public Paging() {
		// TODO Auto-generated constructor stub
	}
	
	

	
	
	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}
	
	public int getPerPageNum() {
		return perPageNum;
	}
	
	public void setStartRow(int pageNum, int perPageNum) {
		this.startRow =  (pageNum-1)*perPageNum;
	}
	
	public int getStartRow() {
		return startRow;
	}
	
	

	
	
}
