package model;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Paths;

@WebServlet("/upload")
@MultipartConfig
public class FileUploadServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    final static String driver = "org.mariadb.jdbc.Driver";
    final String DB_IP = "192.168.32.14";
    final String DB_PORT = "3306";
    final String DB_NAME = "bibliotdb";
    final String DB_URL1 = "jdbc:mariadb://" + DB_IP + ":" + DB_PORT + "/" + DB_NAME;
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "1234";

    static {
        try {
            // JDBC 드라이버 등록
            Class.forName(driver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String[] fileNames = new String[2]; // 두 파일 이름을 저장

        for (int i = 0; i < 2; i++) {
            Part filePart = request.getPart("files" + i);
            String fileName = filePart.getSubmittedFileName();
            File file = new File("C:\\Users\\moon4\\eclipse-workspace\\Bibliot\\python\\data\\" + fileName); // 경로 수정

            try (InputStream fileContent = filePart.getInputStream()) {
                Files.copy(fileContent, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
                saveFileToDatabase(fileName);
                fileNames[i] = fileName; // 파일 이름 저장
            } catch (SQLException e) {
                e.printStackTrace();
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error");
                return;
            }
        }
        System.out.println("100");
        // Python 스크립트 호출
        ProcessBuilder pb = new ProcessBuilder(
            "C:\\Users\\moon4\\AppData\\Local\\Programs\\Python\\Python312\\python.exe", 
            "C:\\Users\\moon4\\eclipse-workspace\\Bibliot\\python\\data.preprocessing.py", 
            "C:\\Users\\moon4\\eclipse-workspace\\Bibliot\\python\\data\\" + fileNames[0],
            "C:\\Users\\moon4\\eclipse-workspace\\Bibliot\\python\\data\\" + fileNames[1]);

        pb.redirectErrorStream(true);
        Process process = pb.start();
       
        // Python 프로세스의 출력 읽기
        try (BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()))) {
            String line;
            while ((line = reader.readLine()) != null) {
                System.out.println(line);
            }
        }
        
        // Python 프로세스가 끝날 때까지 대기
        try {
            process.waitFor();
            System.out.println("작업 끝났습니다.");
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

     // JSON 파일 읽기
        String jsonFilePath = "C:\\Users\\moon4\\eclipse-workspace\\Bibliot\\src\\main\\webapp\\dataImage\\graph_data.json"; // JSON 파일 경로
        File jsonFile = new File(jsonFilePath);
        
        // JSON 파일 존재 여부 확인
        if (!jsonFile.exists()) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "JSON file not found");
            return;
        }

        // JSON 파일 읽기
        try {
            String jsonData = readFile(jsonFilePath);
            response.setContentType("application/json");
            response.getWriter().write(jsonData);
            System.out.println("JSON 파일 읽기 성공");
        } catch (IOException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error reading file: " + e.getMessage());
        }
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String filePath = "C:\\Users\\moon4\\eclipse-workspace\\Bibliot\\src\\main\\webapp\\dataImage\\graph_data.json"; // JSON 파일 경로
        
        // JSON 파일 존재 여부 확인
        File jsonFile = new File(filePath);
        if (!jsonFile.exists()) {
            System.out.println("JSON 파일이 존재하지 않습니다: " + filePath);
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "JSON file not found");
            return;
        }

        // JSON 파일 읽기
        try {
            String jsonData = readFile(filePath);
            response.setContentType("application/json");
            response.getWriter().write(jsonData);
            System.out.println("Json 파일 읽기 성공");
        } catch (IOException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error reading file: " + e.getMessage());
        }
    }
    
    private String readFile(String filePath) throws IOException {
        return new String(Files.readAllBytes(Paths.get(filePath)), StandardCharsets.UTF_8);
    }
    
    // DB에 사용자가 올린 파일 저장
    private void saveFileToDatabase(String fileName) throws SQLException {
        String insertSQL = "INSERT INTO uploaded_files (file_name) VALUES (?)";

        try (Connection conn = DriverManager.getConnection(DB_URL1, DB_USER, DB_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(insertSQL)) {
            stmt.setString(1, fileName);
            stmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("DB 삽입 실패");
            e.printStackTrace();
            throw e;
        }
        System.out.println("DB 삽입 성공");
    }
}
