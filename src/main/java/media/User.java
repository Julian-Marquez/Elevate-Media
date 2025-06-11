package media;

public class User {
	
	private String firstName;
	private String lastName;
	private String email;
	private String phoneNum;
	private byte[] proiflePic;
	private String password;
	private String username;
	private long id;
	
	public User(String fname, String lname,String email,String username, String password ) {
		this.firstName = fname;
		this.lastName = lname;
		this.email = email;
		this.password = password;
		this.username = username;
		this.id = 0;
}
	
	public void setFirstName(String fname) {
		this.firstName = fname;
	}
	
	public void setLastName(String lname) {
		this.lastName = lname;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNum = phoneNumber;
	}
	
	public void setUserId(long id) {
		this.id = id;
	}
	
	public void setProfilePic(byte[] pic) {
		this.proiflePic = pic;
	}
	
	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getFirstName() {
		return this.firstName;
	}
	
	public String getLastName() {
		return this.lastName;
	}
	
	public String getPhoneNumber() {
		return this.phoneNum;
	}
	
	public String getPassword() {
		return this.password;
	}
	
	public String getEmail() {
		return this.email;
	}
	
	public String getUsername() {
		return this.username;
	}
	
	public long getUserId() {
		return this.id;
	}
	
	public byte[] getProfilePic() {
		return this.proiflePic;
	}
	
}