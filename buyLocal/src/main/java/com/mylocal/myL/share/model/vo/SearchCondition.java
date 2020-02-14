package com.mylocal.myL.share.model.vo;

public class SearchCondition {
	
	private String all;
	private String writer;
	private String title;
	private String content;
	
	public SearchCondition() {}

	public SearchCondition(String all, String writer, String title, String content) {
		super();
		this.all = all;
		this.writer = writer;
		this.title = title;
		this.content = content;
	}

	public String getAll() {
		return all;
	}

	public void setAll(String all) {
		this.all = all;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "SearchCondition [all=" + all + ", writer=" + writer + ", title=" + title + ", content=" + content + "]";
	}
}
