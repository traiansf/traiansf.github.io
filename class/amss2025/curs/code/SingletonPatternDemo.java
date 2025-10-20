// Singleton class
class DatabaseConnection {
    // Step 1: Create a private static instance of the class
    private static DatabaseConnection instance;

    // Step 2: Make the constructor private to prevent instantiation
    private DatabaseConnection() {
        System.out.println("Connecting to the database...");
    }

    // Step 3: Provide a public static method to get the single instance
    public static DatabaseConnection getInstance() {
        if (instance == null) {
            instance = new DatabaseConnection();
        }
        return instance;
    }

    // Example method
    public void query(String sql) {
        System.out.println("Executing query: " + sql);
    }
}

// Demo class
public class SingletonPatternDemo {
    public static void main(String[] args) {
        DatabaseConnection conn1 = DatabaseConnection.getInstance();
        DatabaseConnection conn2 = DatabaseConnection.getInstance();

        conn1.query("SELECT * FROM users");

        // Show that both references point to the same object
        System.out.println(conn1 == conn2); // true
    }
}
