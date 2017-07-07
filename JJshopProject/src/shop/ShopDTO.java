package shop;

public class ShopDTO {
	
	private int pdnum;
	private String pdname;
	private int countpd;
	private int category;
	private int price;
	private String img;
	private String info;
	private String color;
	private String pdsize;
	
	
	
	
	public ShopDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public ShopDTO(int pdnum, String pdname, int countpd, int category, int price, String img, String info,
			String color, String pdsize) {
		super();
		this.pdnum = pdnum;
		this.pdname = pdname;
		this.countpd = countpd;
		this.category = category;
		this.price = price;
		this.img = img;
		this.info = info;
		this.color = color;
		this.pdsize = pdsize;
	}

	public int getPdnum() {
		return pdnum;
	}

	public void setPdnum(int pdnum) {
		this.pdnum = pdnum;
	}

	public String getPdname() {
		return pdname;
	}

	public void setPdname(String pdname) {
		this.pdname = pdname;
	}

	public int getCountpd() {
		return countpd;
	}

	public void setCountpd(int countpd) {
		this.countpd = countpd;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getPdsize() {
		return pdsize;
	}

	public void setPdsize(String pdsize) {
		this.pdsize = pdsize;
	}
	
	
	
	

}
