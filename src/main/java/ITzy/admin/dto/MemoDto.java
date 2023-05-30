package ITzy.admin.dto;

import java.io.Serializable;

public class MemoDto implements Serializable{
	
	private int seq;
	private String memo;
	private String id;
	private String wdate;
	
	public MemoDto() {}

	public MemoDto(int seq, String memo, String id, String wdate) {
		super();
		this.seq = seq;
		this.memo = memo;
		this.id = id;
		this.wdate = wdate;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	@Override
	public String toString() {
		return "MemoDto [seq=" + seq + ", memo=" + memo + ", id=" + id + ", wdate=" + wdate + "]";
	}
	
	

	
	

}
