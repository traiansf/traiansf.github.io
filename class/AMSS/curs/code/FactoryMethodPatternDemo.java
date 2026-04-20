abstract class Document {
    public abstract void open();
}

class PDFDocument extends Document {
    public void open() {
        System.out.println("Opening PDF Document");
    }
}

class WordDocument extends Document {
    public void open() {
        System.out.println("Opening Word Document");
    }
}

abstract class Application {
    public abstract Document createDocument();

    public void newDocument() {
        Document doc = createDocument();
        doc.open();
    }
}

class PDFApp extends Application {
    public Document createDocument() {
        return new PDFDocument();
    }
}

class WordApp extends Application {
    public Document createDocument() {
        return new WordDocument();
    }
}

public class FactoryMethodPatternDemo {
    public static void main(String[] args) {
        Application pdfApp = new PDFApp();
        pdfApp.newDocument();

        Application wordApp = new WordApp();
        wordApp.newDocument();
    }
}
