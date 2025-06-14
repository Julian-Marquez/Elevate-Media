package media;

import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.*;


public class Recover extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Recover() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ServletContext context = request.getServletContext();
		
		String action = request.getParameter("action");
		String email = request.getParameter("email");
		String code = request.getParameter("code");
		
		Database connect = new Database();
		
		List<User> allUsers = connect.getAllUsers();
		
		
		if(action.equals("sendCode")) {
			
			for(User _user : allUsers) {
				if(_user.getEmail().equalsIgnoreCase(email) || _user.getUsername().equalsIgnoreCase(email)) {
			
			Random random =  new Random();
			long setCode = random.nextInt(1000000,99999999);
			
			sendEmail(_user,setCode);
			
			context.setAttribute("message", setCode);
			context.setAttribute("user", _user);
			request.getRequestDispatcher("Recover.jsp").forward(request, response);
			
			}
			}
		}
		else if(action.equals("submit")) {

			try {
				
				long _code  = Long.parseLong(code);
				
				long code_ = (long) context.getAttribute("message");
				
				if(_code == code_) {
					
					User user = (User) context.getAttribute("user");
					
					context.removeAttribute("message");
					context.setAttribute("loggedinUser", user);
					context.setAttribute("updateMessage", true);
					context.removeAttribute("user");
					
					request.getRequestDispatcher("profile.jsp").forward(request, response);
				}
				
			}catch(NumberFormatException e) {
				
			}
			
		}
		
	}
	public void sendEmail(User user, long code) throws UnsupportedEncodingException {
		String subject = "Recovery Code Request";
		String content = "Hello " + user.getFirstName() + " your recovery code is: " + code;
		
		 String host = "smtp.gmail.com";
	        int port = 587;
	        Properties props = new Properties();
	        props.put("mail.smtp.host", host);
	        props.put("mail.smtp.port", port);
	        props.put("mail.smtp.auth", "true");
	        props.put("mail.smtp.starttls.enable", "true");

	        // Authentication information
	        String username = "turbotowing505@gmail.com"; // Use your Gmail address
	        String password = "pwnd mleh nfgf tkxt"; // Use the app-specific password

	        // Create a session with the properties and the authenticator
	        Session session = Session.getInstance(props, new Authenticator() {
	            @Override
	            protected PasswordAuthentication getPasswordAuthentication() {
	                return new PasswordAuthentication(username, password);
	            }
	        });

	        try {
	            // Create a message
	            Message message = new MimeMessage(session);
	            message.setFrom(new InternetAddress("ElevateMedia_Team@gmail.com", "Elevate Media"));
	            message.setReplyTo(InternetAddress.parse("ElevateMedia_Team@gmail.com"));
	            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(user.getEmail()));
	            message.setSubject(subject);
	            message.setText(content);

	            // Send the message
	            Transport.send(message);

	            System.out.println("Email sent successfully!");
	        } catch (MessagingException e) {
	            e.printStackTrace(); // Print the exception details (you can customize this)
	        }
		
	}

}
