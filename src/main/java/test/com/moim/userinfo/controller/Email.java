package test.com.moim.userinfo.controller;

public class Email {
	
    private String subject;
    private String content;
    private String regdate;
    private String receiver;
     
    public String getReceiver() {
        return receiver;
    }
    public void setReceiver(String email) {
        this.receiver = email;
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
    public String getRegdate() {
        return regdate;
    }
    public void setRegdate(String regdate) {
        this.regdate = regdate;
    }
     


}
