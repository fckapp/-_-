package model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/updateEmail1")
public class MyPage_email extends HttpServlet {
	final String driver = "org.mariadb.jdbc.Driver";
	final String DB_IP = "192.168.32.14";
	final String DB_PORT = "3306";
	final String DB_NAME = "bibliotdb";
	final String DB_URL1 = "jdbc:mariadb://" + DB_IP + ":" + DB_PORT + "/" + DB_NAME;
	private static final String DB_USER = "root";
	private static final String DB_PASSWORD = "1234";
	private static final String FROM_EMAIL = "hamjang99@gmail.com";
	private static final String FROM_PASSWORD = "ochh smgs qxcq khfs";
	
    private Map<String, String> verificationCodes = new HashMap<>(); // 인증 코드 저장
    private Map<String, Long> verificationCodeExpiry = new HashMap<>(); // 인증 코드 만료 시간 저장

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String newEmail = request.getParameter("newEmail");
        String verificationCode = request.getParameter("verificationCode");
        String userId = request.getParameter("userId"); // 사용자 ID를 요청에서 가져옴

        // 인증 번호 전송 처리
        if (request.getParameter("sendVerification") != null) {
            String code = generateVerificationCode();
            verificationCodes.put(newEmail, code);
            verificationCodeExpiry.put(newEmail, System.currentTimeMillis() + 300000); // 5분 후 만료
            System.out.println("인증 코드 전송 시도: 이메일 = " + newEmail + ", 코드 = " + code); // 디버그용
            sendVerificationEmail(newEmail, code);
            response.getWriter().write("인증 번호가 전송되었습니다.");
            return;
        }

        // 이메일 수정 처리
        System.out.println("이메일 수정 시도: 새로운 이메일 = " + newEmail + ", 입력된 인증 코드 = " + verificationCode);// 디버그용
        
        if (verificationCodes.containsKey(newEmail) && verificationCodes.get(newEmail).equals(verificationCode)) {
            long expiryTime = verificationCodeExpiry.get(newEmail);
            if (System.currentTimeMillis() <= expiryTime) {
                if (updateEmailInDB(userId, newEmail)) {
                    verificationCodes.remove(newEmail);
                    verificationCodeExpiry.remove(newEmail);
                    response.getWriter().write("이메일이 성공적으로 수정되었습니다.");
                } else {
                    response.getWriter().write("이메일 수정에 실패했습니다.");
                }
            } else {
                response.getWriter().write("인증 번호가 만료되었습니다.");
            }
        } else {
            response.getWriter().write("잘못된 인증 번호입니다.");
        }
    }

    private String generateVerificationCode() {
    	Random random = new Random();
        int code = 100000 + random.nextInt(900000); // 6자리 인증번호 생성
        return String.valueOf(code);
    }

    private void sendVerificationEmail(String email, String code) {
    	if (email == null || email.isEmpty()) {
            throw new IllegalArgumentException("수신자 이메일 주소가 유효하지 않습니다.");
        }
    	
        // 이메일 전송 로직 (SMTP 사용 등)
        String subject = "smtp.gmail.com";
        String message = "587" + code;

        // SMTP 설정 (예: Gmail)
        String from = FROM_EMAIL;
        String password = FROM_PASSWORD;

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }
        });

        try {
            Message msg = new MimeMessage(session);
            msg.setFrom(new InternetAddress(from));
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
            msg.setSubject(subject);
            msg.setText(message);
            Transport.send(msg);
            System.out.println("이메일이 성공적으로 전송되었습니다: " + email); //디버그용
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

    private boolean updateEmailInDB(String userId, String newEmail) {
        String sql = "UPDATE customers SET email = ? WHERE cust_id_PK = ?";
        try (Connection connection = DriverManager.getConnection(DB_URL1, DB_USER, DB_PASSWORD);	
             PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, newEmail);
            pstmt.setString(2, userId);

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
                
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("이메일 전송 실패: " + e.getMessage());
            return false;
        }
    }
}