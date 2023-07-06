package day0704;

public class Board {
	
	private String writer;		//글쓴이
	private String subject;		//제목
	private String content;		//내용
	
	public Board() {
	}
	
	public Board(String w, String s, String c) {
		this.writer = w;
		this.subject = s;
		this.content = c;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	
}
