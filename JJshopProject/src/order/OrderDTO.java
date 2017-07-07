package order;

import java.util.Date;

public class OrderDTO {
	private int ornum;
	private int pdnum;
	private String orname;
	private int orprice;
	private String orsize;
	private int orcnt;
	private String orcolor;
	private String oruser;
	private Date ordate;
	private String oraddr;
	private int category;
	private String img;

	public OrderDTO() {
		// TODO Auto-generated constructor stub
	}

	public OrderDTO(int ornum, int pdnum, String orname, int orprice, String orsize, int orcnt, String orcolor,
			String oruser, Date ordate, String oraddr, int category, String img) {
		super();
		this.ornum = ornum;
		this.pdnum = pdnum;
		this.orname = orname;
		this.orprice = orprice;
		this.orsize = orsize;
		this.orcnt = orcnt;
		this.orcolor = orcolor;
		this.oruser = oruser;
		this.ordate = ordate;
		this.oraddr = oraddr;
		this.category = category;
		this.img = img;
	}

	public int getOrnum() {
		return ornum;
	}

	public void setOrnum(int ornum) {
		this.ornum = ornum;
	}

	public int getPdnum() {
		return pdnum;
	}

	public void setPdnum(int pdnum) {
		this.pdnum = pdnum;
	}

	public String getOrname() {
		return orname;
	}

	public void setOrname(String orname) {
		this.orname = orname;
	}

	public int getOrprice() {
		return orprice;
	}

	public void setOrprice(int orprice) {
		this.orprice = orprice;
	}

	public String getOrsize() {
		return orsize;
	}

	public void setOrsize(String orsize) {
		this.orsize = orsize;
	}

	public int getOrcnt() {
		return orcnt;
	}

	public void setOrcnt(int orcnt) {
		this.orcnt = orcnt;
	}

	public String getOrcolor() {
		return orcolor;
	}

	public void setOrcolor(String orcolor) {
		this.orcolor = orcolor;
	}

	public String getOruser() {
		return oruser;
	}

	public void setOruser(String oruser) {
		this.oruser = oruser;
	}

	public Date getOrdate() {
		return ordate;
	}

	public void setOrdate(Date ordate) {
		this.ordate = ordate;
	}

	public String getOraddr() {
		return oraddr;
	}

	public void setOraddr(String oraddr) {
		this.oraddr = oraddr;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}
	
	
	
	
	}
