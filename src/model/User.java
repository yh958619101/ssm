package model;

import java.io.Serializable;
public class User   implements Serializable{
private  Integer   id;
private String username;
private String password;
private Integer status;
private  Integer   area_id;
private  Integer   section_id;
private byte[] file;
private String text;
private String pics;
public Integer getId() {
	return id;
}
public void setId(Integer id) {
	this.id = id;
}
public String getUsername() {
	return username;
}
public void setUsername(String username) {
	this.username = username;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
@Override
public String toString() {
	return "User [id=" + id + ", username=" + username + ", password=" + password + "]";
}


}