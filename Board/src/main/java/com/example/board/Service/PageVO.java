package com.example.board.Service;

public class PageVO {
	private Integer totalcount; // 전체 페이지
	private Integer startpage; // 시작 페이지(if page=16 then startpage=11, if page=4 then startpage=1)
	private Integer endpage; // 끝 페이지
	private Integer page=1; //현재 페이지
	private Integer perpagenum=10; //페이지 당 출력 리스트 개수
	private Integer pagenum=10; // 페이징 개수
	private Integer startpage_boardnum; // 시작 보드갯수
	
	
	
	public Integer getStartpage_boardnum() {
		return startpage_boardnum;
	}
	public void setStartpage_boardnum(Integer startpage_boardnum) {
		this.startpage_boardnum = startpage_boardnum;
	}
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

	public void setCalPage(int perpagenum,int totalcount) {
		this.endpage = (int)Math.ceil((double)totalcount/(double)perpagenum);
		this.startpage = ((int)Math.ceil((double)this.page/(double)this.pagenum)-1)*this.pagenum+1;
		this.startpage_boardnum = (this.page-1) * this.pagenum;
	}
}
