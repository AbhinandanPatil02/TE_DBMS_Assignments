
// MariaDB [student_db]> describe student;
// +-------------+-------------+------+-----+---------+-------+
// | Field       | Type        | Null | Key | Default | Extra |
// +-------------+-------------+------+-----+---------+-------+
// | roll_no     | int(11)     | NO   | PRI | NULL    |       |
// | name        | varchar(50) | NO   |     | NULL    |       |
// | total_marks | int(11)     | YES  |     | NULL    |       |
// | fav_game    | varchar(30) | YES  |     | NULL    |       |
// +-------------+-------------+------+-----+---------+-------+
// 4 rows in set (0.030 sec)



import java.sql.*;
import java.util.Scanner;

public class StudentDatabase {
	private static final String URL = "jdbc:mysql://localhost:3307/student_db";
    private static final String USER = "Abhinandan";
    private static final String PASSWORD = "your_password";

    public static void main(String[] args) {
        try (Connection con = DriverManager.getConnection(URL, USER, PASSWORD);
             Scanner sc = new Scanner(System.in)) {
            System.out.println("Connected to the database.");

            while (true) {
                System.out.println("\nChoose an operation:");
                System.out.println("1. Insert Student");
                System.out.println("2. Update Student");
                System.out.println("3. Delete Student");
                System.out.println("4. Display Students");
                System.out.println("5. Exit");
                
                int choice = sc.nextInt();
                sc.nextLine(); // Consume newline

                switch (choice) {
                    case 1:
                        insertStudent(con, sc);
                        break;
                    case 2:
                        updateStudent(con, sc);
                        break;
                    case 3:
                        deleteStudent(con, sc);
                        break;
                    case 4:
                        displayStudents(con);
                        break;
                    case 5:
                        System.out.println("Exiting...");
                        return;
                    default:
                        System.out.println("Invalid choice. Try again.");
                }
            }
        } 
        catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private static void insertStudent(Connection con, Scanner sc) {
        try {
            String insertQuery = "INSERT INTO Student (roll_no, name, total_marks, fav_game) VALUES (?, ?, ?, ?)";
            try (PreparedStatement pstmtInsert = con.prepareStatement(insertQuery)) {
                System.out.print("Enter Roll Number: ");
                int rollNo = sc.nextInt();
                sc.nextLine(); // Consume newline
                System.out.print("Enter Name: ");
                String name = sc.nextLine();
                System.out.print("Enter Total Marks: ");
                int totalMarks = sc.nextInt();
                sc.nextLine(); // Consume newline
                System.out.print("Enter Favorite Game: ");
                String favGame = sc.nextLine();

                pstmtInsert.setInt(1, rollNo);
                pstmtInsert.setString(2, name);
                pstmtInsert.setInt(3, totalMarks);
                pstmtInsert.setString(4, favGame);
                pstmtInsert.executeUpdate();

                System.out.println("Student added successfully.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private static void updateStudent(Connection con, Scanner sc) {
        System.out.print("Enter Roll Number to update: ");
        int rollNo = sc.nextInt();
        sc.nextLine(); // Consume newline

        try {
            String updateQuery = "UPDATE Student SET name = ?, total_marks = ?, fav_game = ? WHERE roll_no = ?";
            try (PreparedStatement pstmtUpdate = con.prepareStatement(updateQuery)) {
                System.out.print("Enter new Name: ");
                String name = sc.nextLine();
                System.out.print("Enter new Total Marks: ");
                int totalMarks = sc.nextInt();
                sc.nextLine(); // Consume newline
                System.out.print("Enter new Favorite Game: ");
                String favGame = sc.nextLine();

                pstmtUpdate.setString(1, name);
                pstmtUpdate.setInt(2, totalMarks);
                pstmtUpdate.setString(3, favGame);
                pstmtUpdate.setInt(4, rollNo);
                pstmtUpdate.executeUpdate();

                System.out.println("Student updated successfully.");
            }
        } 
        catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private static void deleteStudent(Connection con, Scanner sc) {
        System.out.print("Enter Roll Number to delete: ");
        int rollNo = sc.nextInt();

        try {
            String deleteQuery = "DELETE FROM Student WHERE roll_no = ?";
            try (PreparedStatement pstmtDelete = con.prepareStatement(deleteQuery)) {
                pstmtDelete.setInt(1, rollNo);
                int rowsAffected = pstmtDelete.executeUpdate();
                if (rowsAffected > 0) {
                    System.out.println("Student deleted successfully.");
                } else {
                    System.out.println("Student not found.");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private static void displayStudents(Connection con) {
        String sql = "SELECT * FROM Student";
        try (Statement stmt = con.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            System.out.println("Roll No\tName\tTotal Marks\tFavorite Game");
            while (rs.next()) {
                System.out.println(rs.getInt("roll_no") + "\t" + rs.getString("name") + "\t" +
                        rs.getInt("total_marks") + "\t" + rs.getString("fav_game"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
