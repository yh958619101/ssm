package model;

import java.io.Serializable;

public class Test implements Serializable {
	private String name;
	private int time;
	public Test() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Test(String name, int time) {
		super();
		this.name = name;
		this.time = time;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getTime() {
		return time;
	}
	public void setTime(int time) {
		this.time = time;
	}
	@Override
	public String toString() {
		return "Test [name=" + name + ", time=" + time + "]";
	}
	
	
	
	
	
}
