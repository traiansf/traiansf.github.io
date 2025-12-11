// Subject
interface Database {
    void query(String sql);
}

// Real Subject
class RealDatabase implements Database {
    public RealDatabase() {
        System.out.println("Connecting to database...");
    }
    public void query(String sql) {
        System.out.println("Executing query: " + sql);
    }
}

// Proxy
class DatabaseProxy implements Database {
    private RealDatabase db;

    public void query(String sql) {
        if (db == null) db = new RealDatabase(); // lazy initialization
        db.query(sql);
    }
}

// Usage
public class ProxyPatternDemo {
    public static void main(String[] args) {
        Database db = new DatabaseProxy();
        db.query("SELECT * FROM users");
    }
}
