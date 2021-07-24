
<%@page import="javax.mail.MessagingException"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.util.Properties"%>
<%@page import="com.feedback"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="demo" class="com.feedback" scope="session"/> 

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>    </body>
</html>

            <%
            String name=request.getParameter("name");
            String email=request.getParameter("email");
            String phone=request.getParameter("phone");
            String subject1=request.getParameter("subject");
            String message1=request.getParameter("message");
            String subject=subject1.concat(name);
            String message2=email.concat(phone);
            String message=message2.concat(message1);
            
           
 feedback fb = new feedback(); 
 fb.setName(name);
 fb.setEmail(email);
 fb.setPhone(phone);
 fb.setSubject(subject);
 fb.setMessage(message);

String sendsub=fb.getSubject();
String sendmsg=fb.getMessage();
            String result;           
            String to="dericpaul@gmail.com";

	    String from = fb.getFrom();

	    final String username = fb.getUsname();

	    final String password = fb.getPwd();


	    String host = fb.getHost();

	 

	    Properties props = new Properties();

	    props.put("mail.smtp.auth", "true");

	    props.put("mail.smtp.starttls.enable", "true");

	    props.put("mail.smtp.host", host);

	    props.put("mail.smtp.port", "25");

	    Session mailSession = Session.getInstance(props,

	            new javax.mail.Authenticator() {

	                protected PasswordAuthentication getPasswordAuthentication() {

	                    return new PasswordAuthentication(username,

	                            password);

	                }

	            });
	    try {
	        Message messages = new MimeMessage(mailSession);
	        messages.setFrom(new InternetAddress(from));
	        messages.setRecipients(Message.RecipientType.TO,

	                InternetAddress.parse(to));
        messages.setSubject(sendsub);
	        messages.setText(sendmsg);
	        Transport.send(messages);
	        System.out.println("Sent message successfully....");

	        result = "Sent message successfully....";
	    } catch (MessagingException e) {

	        e.printStackTrace();

        result = "Error: unable to send message....";

	   }



	            System.out.println("Result: " + result + "\n"); 
 %>
 
