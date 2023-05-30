package ITzy.admin.dto;

import java.io.Serializable;

// BBS  Bulletin Board System
public class BbsDto implements Serializable {

	 private int seq;
	    private String id;
	    private String title;
	    private String content;

	    private String filename;
	    private String newfilename;

	    private int readcount;
	    private int downcount;

	    private String regdate;

	    private int del;
	    private int ref;
	    private int step;
	    private int depth;
	    private int love;
	    
	    public BbsDto() {}

		public BbsDto(int seq, String id, String title, String content, String filename, String newfilename, int readcount, int downcount, String regdate, int del, int ref, int step, int depth, int love) {
			super();
			this.seq = seq;
			this.id = id;
			this.title = title;
			this.content = content;
			this.filename = filename;
			this.newfilename = newfilename;
			this.readcount = readcount;
			this.downcount = downcount;
			this.regdate = regdate;
			this.del = del;
			this.ref = ref;
			this.step = step;
			this.depth = depth;
			this.love = love;
		}

		public int getSeq() {
			return seq;
		}

		public void setSeq(int seq) {
			this.seq = seq;
		}

		public String getId() {
			return id;
		}

		public void setId(String id) {
			this.id = id;
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

		public String getFilename() {
			return filename;
		}

		public void setFilename(String filename) {
			this.filename = filename;
		}

		public String getNewfilename() {
			return newfilename;
		}

		public void setNewfilename(String newfilename) {
			this.newfilename = newfilename;
		}

		public int getReadcount() {
			return readcount;
		}

		public void setReadcount(int readcount) {
			this.readcount = readcount;
		}

		public int getDowncount() {
			return downcount;
		}

		public void setDowncount(int downcount) {
			this.downcount = downcount;
		}

		public String getRegdate() {
			return regdate;
		}

		public void setRegdate(String regdate) {
			this.regdate = regdate;
		}

		public int getDel() {
			return del;
		}

		public void setDel(int del) {
			this.del = del;
		}

		public int getRef() {
			return ref;
		}

		public void setRef(int ref) {
			this.ref = ref;
		}

		public int getStep() {
			return step;
		}

		public void setStep(int step) {
			this.step = step;
		}

		public int getDepth() {
			return depth;
		}

		public void setDepth(int depth) {
			this.depth = depth;
		}

		public int getLove() {
			return love;
		}

		public void setLove(int love) {
			this.love = love;
		}

		@Override
		public String toString() {
			return "BbsDto [seq=" + seq + ", id=" + id + ", title=" + title + ", content=" + content + ", filename=" + filename + ", newfilename=" + newfilename + ", readcount=" + readcount + ", downcount=" + downcount + ", regdate=" + regdate + ", del=" + del + ", ref=" + ref + ", step=" + step + ", depth=" + depth + ", love=" + love + "]";
		}
	    
	    
		
	}
