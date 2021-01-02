package com.example.board.Service;

public class PageVO {
	private Integer totalcount; // 전체 페이지
	private Integer startpage; // 시작 페이지
	private Integer endpage; // 끝 페이지
	private Integer page; //현재 페이지
	private Integer perpagenum=10; //페이지 당 출력 리스트 개수
	private Integer pagenum=10; // 페이징 개수
	private Integer perpagetotalcount; // 한 페이지당 개수
	
	public Integer getTotalcount() {
		return totalcount;
	}
	public void setTotalcount(Integer totalcount) {
		this.totalcount = totalcount;
	}
	public Integer getStartpage() {
		return startpage;
	}
	public void setStartpage(Integer startpage) {
		this.startpage = startpage;
	}
	public Integer getEndpage() {
		return endpage;
	}
	public void setEndpage(Integer endpage) {
		this.endpage = endpage;
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getPerpagenum() {
		return perpagenum;
	}
	public void setPerpagenum(Integer perpagenum) {
		this.perpagenum = perpagenum;
	}
	public Integer getPagenum() {
		return pagenum;
	}
	public void setPagenum(Integer pagenum) {
		this.pagenum = pagenum;
	}
	public Integer getPerpagetotalcount() {
		return perpagetotalcount;
	}
	public void setPerpagetotalcount(Integer perpagetotalcount) {
		this.perpagetotalcount = perpagetotalcount;
	}


	public void setCalPage(int perpagenum,int totalcount) {
		this.endpage = (int)Math.ceil((double)totalcount/(double)perpagenum);
		int temp = this.perpagenum * this.pagenum;
		this.perpagetotalcount = (int)Math.ceil((double)totalcount/(double)temp);
	}
}
