// Component
interface FileSystemNode {
    void show();
}

// Leaf
class FileNode implements FileSystemNode {
    private String name;
    FileNode(String name) { this.name = name; }
    public void show() { System.out.println("File: " + name); }
}

// Composite
class Folder implements FileSystemNode {
    private String name;
    private java.util.List<FileSystemNode> children = new java.util.ArrayList<>();

    Folder(String name) { this.name = name; }

    public void add(FileSystemNode node) { children.add(node); }

    public void show() {
        System.out.println("Folder: " + name);
        for (FileSystemNode child : children) child.show();
    }
}

// Usage
public class CompositePatternDemo {
    public static void main(String[] args) {
        Folder root = new Folder("root");
        root.add(new FileNode("file1.txt"));

        Folder sub = new Folder("subfolder");
        sub.add(new FileNode("file2.txt"));
        root.add(sub);

        root.show();
    }
}
