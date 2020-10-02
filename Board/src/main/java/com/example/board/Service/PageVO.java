package com.example.board.Service;

public class PageVO {
	private int totalcount; // 전체 페이지
	private int startpage; // 시작 페이지
	private int endpage; // 끝 페이지
	private int page; //현재 페이지
	private int perpagenum=10; //페이지 당 출력 리스트 개수
	private int pagenum=10; // 페이징 개수
	private int perpagetotalcount; // 한 페이지당 개수
	
	public int getPagenum() {
		return pagenum;
	}
	public void setPagenum(int pagenum) {
		this.pagenum = pagenum;
	}
	public int getPerpagetotalcount() {
		return perpagetotalcount;
	}
	public void setPerpagetotalcount(int perpagetotalcount) {
		this.perpagetotalcount = perpagetotalcount;
	}
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
	
	public void setCalPage(int perpagenum,int totalcount) {
		this.endpage = (int)Math.ceil((double)totalcount/(double)perpagenum);
		int temp = this.perpagenum * this.pagenum;
		this.perpagetotalcount = (int)Math.ceil((double)totalcount/(double)temp);
	}
}
