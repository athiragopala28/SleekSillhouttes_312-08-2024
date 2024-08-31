package bean;

import java.sql.Timestamp;

public class User {

    private int usersId;
    private String name;
    private String phone;
    private String email;
    private String password;
    private Timestamp createdAt;
	public int getUsersId() {
		return usersId;
	}
	public void setUsersId(int usersId) {
		this.usersId = usersId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Timestamp getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}
	public User(int usersId, String name, String phone, String email, String password, Timestamp createdAt) {
		super();
		this.usersId = usersId;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.password = password;
		this.createdAt = createdAt;
	}
	public User() {
		super();
	}
	@Override
	public String toString() {
		return "User [usersId=" + usersId + ", name=" + name + ", phone=" + phone + ", email=" + email + ", password="
				+ password + ", createdAt=" + createdAt + "]";
	}
    
    
}