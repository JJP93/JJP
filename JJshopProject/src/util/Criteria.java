package util;

public class Criteria {
private int page;
private int perPageNum;

public Criteria() {
	// TODO Auto-generated constructor stub
	this.page=1;

}

public void setPage(int page) {
	if(page <= 0){
		this.page = 1;
		return;
	}
	this.page = page;
}

public void setPerPageNum(int perPageNum) {
	
	this.perPageNum = perPageNum;
}

public int getPage() {
	return page;
}

public int getPageStart(){
	return (this.page-1)*perPageNum;
}

public int getPerPageNum() {
	return this.perPageNum;
}

}
