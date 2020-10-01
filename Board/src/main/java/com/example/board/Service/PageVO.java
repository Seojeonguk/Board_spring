package com.example.board.Service;

public class PageVO {
	private int totalcount;
	private int startpage;
	private int endpage;
	private int displaypage=10;
	private int page;
	private int perpagenum;
	
	public int getTotalcount() {
		return totalcount;
	}
	public void setTotalcount(int totalcount) {
		this.totalcount = totalcount;
	}
	public int getStartpage() {
		return startpage;
	}
	public void setStartpage(int startpage) {
		this.startpage = startpage;
	}
	public int getEndpage() {
		return endpage;
	}
	public void setEndpage(int endpage) {
		this.endpage = endpage;
	}
	public int getDisplaypage() {
		return displaypage;
	}
	public void setDisplaypage(int displaypage) {
		this.displaypage = displaypage;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getPerpagenum() {
		return perpagenum;
	}
	public void setPerpagenum(int perpagenum) {
		this.perpagenum = perpagenum;
	}
}
