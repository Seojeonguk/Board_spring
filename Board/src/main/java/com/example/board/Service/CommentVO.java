package com.example.board.Service;

public class CommentVO {
	private Integer comment_number;
	private Integer board_number;
	private String comment_writer="";
	private String comment_date="";
	private String comment_content="";
	public Integer getComment_number() {
		return comment_number;
	}
	public void setComment_number(Integer comment_number) {
		this.comment_number = comment_number;
	}
	public Integer getBoard_number() {
		return board_number;
	}
	public void setBoard_number(Integer board_number) {
		this.board_number = board_number;
	}
	public String getComment_writer() {
		return comment_writer;
	}
	public void setComment_writer(String comment_writer) {
		this.comment_writer = comment_writer;
	}
	public String getComment_date() {
		return comment_date;
	}
	public void setComment_date(String comment_date) {
		this.comment_date = comment_date;
	}
	public String getComment_content() {
		return comment_content;
	}
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
}
