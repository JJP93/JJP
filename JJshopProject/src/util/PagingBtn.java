package util;

public class PagingBtn    {

	int endPage;
	int startPage;
	int tempEndPage;
	int displayPage;
	
	Paging pg;
	

	
	public void setDisplayPage(int displayPage){
		this.displayPage = displayPage;
	}
	
	public int getDisplayPage(){
		return this.displayPage;
	}
	
	public void setEndPage(Paging pg,int displayPage){
		
		this.endPage = (int)Math.ceil(pg.pageNum/(double)getDisplayPage())*displayPage;
		
	}
	
	
	public int getEndPage(){
		
		return endPage;
	}
	
	public void setStartPage(){
		
		this.startPage = (int)Math.ceil(getEndPage() - getDisplayPage())+1;
		
	}
	
	public int getStartPage(){
		
		return this.startPage;
	}

	

	public void setTempEndPage(int totalData,Paging pg) {
		this.tempEndPage =(int) Math.ceil(totalData/(double)pg.perPageNum);
	}
	
	public int getTempEndPage() {
		return tempEndPage;
	}
	
	
	
	
	
	
	
	
	
}
