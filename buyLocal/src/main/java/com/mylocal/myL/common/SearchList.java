package com.mylocal.myL.common;

public class SearchList {
	private int searchNo;
	private String searchStr;
	private int searchCount;
	
	public SearchList() {}

	public SearchList(int searchNo, String searchStr, int searchCount) {
		super();
		this.searchNo = searchNo;
		this.searchStr = searchStr;
		this.searchCount = searchCount;
	}

	public int getSearchNo() {
		return searchNo;
	}

	public void setSearchNo(int searchNo) {
		this.searchNo = searchNo;
	}

	public String getSearchStr() {
		return searchStr;
	}

	public void setSearchStr(String searchStr) {
		this.searchStr = searchStr;
	}

	public int getSearchCount() {
		return searchCount;
	}

	public void setSearchCount(int searchCount) {
		this.searchCount = searchCount;
	}

	@Override
	public String toString() {
		return "SearchList [searchNo=" + searchNo + ", searchStr=" + searchStr + "]";
	}
	
	
}
