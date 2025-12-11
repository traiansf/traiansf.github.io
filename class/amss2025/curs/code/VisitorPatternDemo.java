// Element
interface Shape {
    void accept(Visitor v);
}

// Concrete Elements
class Circle implements Shape {
    double radius = 5;
    public void accept(Visitor v) { v.visit(this); }
}

class Rectangle implements Shape {
    double width = 4, height = 3;
    public void accept(Visitor v) { v.visit(this); }
}

// Visitor
interface Visitor {
    void visit(Circle c);
    void visit(Rectangle r);
}

// Concrete Visitor
class AreaCalculator implements Visitor {
    public void visit(Circle c) {
        System.out.println("Circle area = " + Math.PI * c.radius * c.radius);
    }
    public void visit(Rectangle r) {
        System.out.println("Rectangle area = " + r.width * r.height);
    }
}

// Usage
public class VisitorPatternDemo {
    public static void main(String[] args) {
        Shape[] shapes = { new Circle(), new Rectangle() };
        Visitor areaVisitor = new AreaCalculator();

        for (Shape s : shapes) s.accept(areaVisitor);
    }
}
