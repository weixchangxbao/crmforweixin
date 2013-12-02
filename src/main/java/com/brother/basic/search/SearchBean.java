package com.brother.basic.search;

public class SearchBean {
	
	private int iDisplayStart;
	private int iDisplayLength;
	private int iColumns;
	private String sSearch;
	private int iSortingCols;
	private String sEcho;
	
	public int getPage(){
		return iDisplayStart/iDisplayLength;
	}
	
	public int getiDisplayStart() {
		return iDisplayStart;
	}
	public void setiDisplayStart(int iDisplayStart) {
		this.iDisplayStart = iDisplayStart;
	}
	public int getiDisplayLength() {
		return iDisplayLength;
	}
	public void setiDisplayLength(int iDisplayLength) {
		this.iDisplayLength = iDisplayLength;
	}
	public int getiColumns() {
		return iColumns;
	}
	public void setiColumns(int iColumns) {
		this.iColumns = iColumns;
	}
	public String getsSearch() {
		return sSearch;
	}
	public void setsSearch(String sSearch) {
		this.sSearch = sSearch;
	}
	public int getiSortingCols() {
		return iSortingCols;
	}
	public void setiSortingCols(int iSortingCols) {
		this.iSortingCols = iSortingCols;
	}
	public String getsEcho() {
		return sEcho;
	}
	public void setsEcho(String sEcho) {
		this.sEcho = sEcho;
	}
	
}	
