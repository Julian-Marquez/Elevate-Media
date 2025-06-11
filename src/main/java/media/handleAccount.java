package media;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;

/**
 * Servlet implementation class handleAccount
 */
@MultipartConfig
public class handleAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public handleAccount() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//simple logging the user out
		ServletContext context = getServletContext(); 
		
		String action = request.getParameter("action");
		
		if(action.equals("delete")) {
			Database connect = new Database();
			User user  = (User) context.getAttribute("loggedinUser");
			connect.deleteUser(user);
		}
		
		context.removeAttribute("loggedinUser");
		
		request.getRequestDispatcher("index.jsp").forward(request, response); //back to the home page and logged out
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ServletContext context = request.getServletContext();
		
		String fname = request.getParameter("firstName");
		String lname = request.getParameter("lastName");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String confirmPassword = request.getParameter("confirmPassword");
		String email = request.getParameter("email");
		
		//optional feilds
		String phone = request.getParameter("phone");
		String profilePic = request.getParameter("image");
		
		User user = (User) context.getAttribute("loggedinUser");
		
		String ogEmail = user.getEmail();
		try {
		if(!fname.isEmpty()) {
			user.setFirstName(fname);
		}
		if(!lname.isEmpty()) {
			user.setLastName(lname);
		}
		if(!email.isEmpty()) {
			user.setEmail(email);
		}
		if(!username.isEmpty()) {
			user.setUsername(username);
		}
		if(!password.isEmpty() && password.equals(confirmPassword)) {
			boolean isValid = validate(password,confirmPassword);
			if(isValid) {
				user.setPassword(password);
			}
		}
		if(!phone.isEmpty()) {
			user.setPhoneNumber(phone);
		}
		Account edit = new Account();
		try {
			
		    Part filePart = request.getPart("file");

		    String fileName = edit.getFileName(filePart);
		    String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
		    File uploadDir = new File(uploadPath);
		    if (!uploadDir.exists()) {
		        uploadDir.mkdir(); // Create the directory if it doesn't exist
		    }

		    String filePath = uploadPath + File.separator + fileName;
		    byte[] imgData = null;

		    try (InputStream inputStream = filePart.getInputStream()) {
		        imgData = inputStream.readAllBytes();
		        
		        user.setProfilePic(imgData); //image provided by the user
		        
		    } catch (IOException e) {
		        e.printStackTrace();
		    }
		    }catch(NullPointerException e) {
		
		    //	newUser.setPrpfilePic(staticImgPath); //image generated and set for the user
		    	}
		    
		    if(user.getProfilePic() == null) {
		    	
		    	String staticPics[] = {""}; //static place holder
		    	
		    	String profilePicPath = "images/staticUser.png";
		    	byte[] staticImgPath = edit.fileToByteArray(getServletContext(),profilePicPath);
		    	

		    	user.setProfilePic(staticImgPath); //image generated and set for the user

		    }

		    try {
		    String picPath = edit.byteArrayToFile(user.getProfilePic());
		    }catch(NullPointerException e) {
		  
		    }
		    
		    Database connect = new Database();
		    
		    connect.updateUser(user);
		    
		    context.setAttribute("loggedinUser", user);
		    
		    request.getRequestDispatcher("profile.jsp").forward(request, response); 
			
		}catch(NullPointerException e) {
			
		}
	}

	public boolean validate(String password, String confirmPassword) {
		boolean valid = false;
		String[] specialChars = {"!","@","#","$","%","^","&","*"};// valid special chars
		
		boolean conatinSpecial = false;
		
		for(String Char: specialChars) {
			if(password.contains(Char)) {
				conatinSpecial = true;
			}
		}
		
		if(conatinSpecial && password.equals(confirmPassword) && password.length() > 7) {
			valid = true; // redirect them if all is wrong
		}
		return valid;
	}
}
