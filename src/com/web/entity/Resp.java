package com.web.entity;

public class Resp {

	private String err;
	private String msg;

	public String getErr() {
		return err;
	}

	public void setErr(String err) {
		this.err = err;
		if(err!=null && err.equals("null"))this.err=null;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
		if(msg!=null && msg.equals("null"))this.msg=null;
	}

	@Override
	public String toString() {
		return "Resp [err=" + err + ", msg=" + msg + "]";
	}

}
