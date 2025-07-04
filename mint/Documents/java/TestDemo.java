import java.io.*;
import java.util.*;

class Student {
    private String mssv;
    private String name;
    private int age;
    private String gender;
    private double gpa;

    public Student(String mssv, String name, int age, String gender, double gpa) {
        this.mssv = mssv;
        this.name = name;
        this.age = age;
        this.gender = gender;
        this.gpa = gpa;
    }

    public String getMssv() {
        return mssv;
    }

    @Override
    public String toString() {
        return String.format("MSSV: %s, Name: %s, Age: %d, Gender: %s, GPA: %.2f",
                mssv, name, age, gender, gpa);
    }

    // Chuẩn bị chuỗi để lưu file (các trường cách nhau bởi |)
    public String toDataString() {
        return mssv + "|" + name + "|" + age + "|" + gender + "|" + gpa;
    }

    // Tạo Student từ chuỗi dữ liệu file
    public static Student fromDataString(String data) {
        String[] parts = data.split("\\|");
        if (parts.length != 5) return null;
        try {
            String mssv = parts[0];
            String name = parts[1];
            int age = Integer.parseInt(parts[2]);
            String gender = parts[3];
            double gpa = Double.parseDouble(parts[4]);
            return new Student(mssv, name, age, gender, gpa);
        } catch (Exception e) {
            return null;
        }
    }
}

class ClassRoom {
    private List<Student> students;

    public ClassRoom() {
        students = new ArrayList<>();
    }

    public void addStudent(Student s) {
        students.add(s);
        System.out.println("Added student: " + s.getMssv());
    }

    public boolean removeStudent(String mssv) {
        Iterator<Student> it = students.iterator();
        while (it.hasNext()) {
            Student s = it.next();
            if (s.getMssv().equals(mssv)) {
                it.remove();
                System.out.println("Removed student: " + mssv);
                return true;
            }
        }
        System.out.println("Student with MSSV " + mssv + " not found.");
        return false;
    }

    public void showAllStudents() {
        if (students.isEmpty()) {
            System.out.println("No students in the class.");
            return;
        }
        System.out.println("List of students:");
        for (Student s : students) {
            System.out.println(s);
        }
    }

    public boolean hasStudents() {
        return !students.isEmpty();
    }

    // Lưu dữ liệu lớp học vào file db.txt (ghi đè)
    public void saveToFile(String filename) {
        try (PrintWriter pw = new PrintWriter(new FileWriter(filename, false))) {
            for (Student s : students) {
                pw.println(s.toDataString());
            }
            System.out.println("Class data saved to " + filename);
        } catch (IOException e) {
            System.out.println("Error saving data: " + e.getMessage());
        }
    }

    // Đọc dữ liệu từ file db.txt, thay thế danh sách học sinh hiện tại
    public void loadFromFile(String filename) {
        students.clear();
        File file = new File(filename);
        if (!file.exists()) {
            System.out.println("File " + filename + " does not exist. Starting with empty class.");
            return;
        }
        try (BufferedReader br = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = br.readLine()) != null) {
                Student s = Student.fromDataString(line);
                if (s != null) {
                    students.add(s);
                }
            }
            System.out.println("Class data loaded from " + filename);
        } catch (IOException e) {
            System.out.println("Error loading data: " + e.getMessage());
        }
    }
}

public class TestDemo {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        ClassRoom classRoom = new ClassRoom();
        final String DB_FILE = "db.txt";

        // Tải dữ liệu từ file khi bắt đầu
        classRoom.loadFromFile(DB_FILE);

        while (true) {
            System.out.println("\nStudent Management");
            System.out.println("1. Create a new class (clear current data)");
            System.out.println("2. Add student");
            System.out.println("3. Kill (Remove) a student");
            System.out.println("4. Show all students");
            System.out.println("5. Reload student list from file");
            System.out.println("6. Exit and save");
            System.out.print("Enter your choice (1-6): ");

            int choice;
            try {
                choice = Integer.parseInt(sc.nextLine());
            } catch (Exception e) {
                System.out.println("Invalid input, please enter a number.");
                continue;
            }

            switch (choice) {
                case 1:
                    classRoom = new ClassRoom();
                    System.out.println("Class created successfully. Previous data cleared.");
                    break;
                case 2:
                    System.out.print("Enter MSSV: ");
                    String mssv = sc.nextLine();
                    System.out.print("Enter Name: ");
                    String name = sc.nextLine();
                    System.out.print("Enter Age: ");
                    int age;
                    try {
                        age = Integer.parseInt(sc.nextLine());
                    } catch (Exception e) {
                        System.out.println("Invalid age input.");
                        break;
                    }
                    System.out.print("Enter Gender: ");
                    String gender = sc.nextLine();
                    System.out.print("Enter GPA: ");
                    double gpa;
                    try {
                        gpa = Double.parseDouble(sc.nextLine());
                    } catch (Exception e) {
                        System.out.println("Invalid GPA input.");
                        break;
                    }
                    Student newStudent = new Student(mssv, name, age, gender, gpa);
                    classRoom.addStudent(newStudent);
                    break;
                case 3:
                    System.out.print("Enter MSSV of student to remove: ");
                    String removeMssv = sc.nextLine();
                    classRoom.removeStudent(removeMssv);
                    break;
                case 4:
                    classRoom.showAllStudents();
                    break;
                case 5:
                    classRoom.loadFromFile(DB_FILE);
                    break;
                case 6:
                    // Lưu dữ liệu trước khi thoát
                    classRoom.saveToFile(DB_FILE);
                    System.out.println("Exiting program. Goodbye!");
                    sc.close();
                    return;
                default:
                    System.out.println("Invalid choice. Please select 1-6.");
            }
        }
    }
}
