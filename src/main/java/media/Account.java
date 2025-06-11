package media;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.util.Random;

import jakarta.servlet.ServletContext;


@MultipartConfig
public class Account extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Account() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//this will handle the login aspect
		
		ServletContext context = request.getServletContext();
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		Database connect = new Database();
		User loggedinUser = null;
		//connect.clearAllUsers();
		for(User user : connect.getAllUsers()) {
			System.out.println(user.getUsername() + " " + user.getPassword());
			if(user.getEmail().equals(email) && user.getPassword().equals(password)
					|| user.getUsername().equals(email) && user.getPassword().equals(password)) {
				loggedinUser = user;
				context.setAttribute("loggedinUser", loggedinUser);
				request.getRequestDispatcher("profile.jsp").forward(request, response);
				return;
			}
		}
		request.getRequestDispatcher("register.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//this will handle the register aspect
		
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
		
		//check the password validation
		
		String[] specialChars = {"!","@","#","$","%","^","&","*"};// valid special chars
		
		boolean conatinSpecial = false;
		
		for(String Char: specialChars) {
			if(password.contains(Char)) {
				conatinSpecial = true;
			}
		}
		
		if(!conatinSpecial && !password.equals(confirmPassword) && password.length() < 7) {
			request.getRequestDispatcher("register.jsp").forward(request, response); // redirect them if all is wrong
		}
		
		User user = new User(fname,lname, email, username, password );
		
		try {
		if(!phone.isEmpty()) {
			user.setPhoneNumber(phone); //if the user wants to provide a phone Number
		}
		}catch(NullPointerException e) {
			
		}
		
		try {
		    Part filePart = request.getPart("file");

		    String fileName = getFileName(filePart);
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
		    	byte[] staticImgPath = fileToByteArray(getServletContext(),profilePicPath);
		    	

		    	user.setProfilePic(staticImgPath); //image generated and set for the user

		    }

		    try {
		    String picPath = byteArrayToFile(user.getProfilePic());
		    }catch(NullPointerException e) {
		  
		    }
		    
		    context.setAttribute("loggedinUser", user); // now that the user is created the user is logged in
		    
		    Database connect = new Database();
		    
		    connect.createUser(user); // now we add the user to the database
		
		    request.getRequestDispatcher("profile.jsp").forward(request, response); // this indicates success if reached
		    
	}
	
	public static byte[] fileToByteArray(ServletContext context, String relativePath) throws IOException {
	    String absolutePath = context.getRealPath(relativePath);
	    File file = new File(absolutePath);

	    if (!file.exists()) {
	        throw new FileNotFoundException("File not found: " + absolutePath);
	    }

	    return Files.readAllBytes(file.toPath());
	}


	  public String getFileName(Part part) {
	        String contentDisposition = part.getHeader("content-disposition");
	        if (contentDisposition != null) {
	            for (String content : contentDisposition.split(";")) {
	                if (content.trim().startsWith("filename")) {
	                    return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
	                }
	            }
	        }
	        return null;
	    }
	  
	  public static String byteArrayToFile(byte[] byteArray) throws IOException {
	

		    // Create a temporary file with a generic extension (e.g., ".tmp")
		    File tempFile = Files.createTempFile("file_", ".tmp").toFile();

		    // Write the byte array to the temporary file
		    try (FileOutputStream fos = new FileOutputStream(tempFile)) {
		        fos.write(byteArray);
		    }

		    // Ensure the temporary file persists until explicitly deleted
		    tempFile.deleteOnExit();

		    // Return the absolute path of the created file
		    return tempFile.getAbsolutePath();
		}
	 

}
