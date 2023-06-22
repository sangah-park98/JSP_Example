package com.tjoeun.fileupload;

public class FileVO {
	
	private int idx;
	private String filename;
	private String fileRealname;
	private int downloadCount;
	
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getFileRealname() {
		return fileRealname;
	}
	public void setFileRealname(String fileRealname) {
		this.fileRealname = fileRealname;
	}
	public int getDownloadCount() {
		return downloadCount;
	}
	public void setDownloadCount(int downloadCount) {
		this.downloadCount = downloadCount;
	}
	
	@Override
	public String toString() {
		return "FileVO [idx=" + idx + ", filename=" + filename + ", fileRealname=" + fileRealname + ", downloadCount="
				+ downloadCount + "]";
	}
	
	
}
