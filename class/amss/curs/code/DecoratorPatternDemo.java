// Component
interface Beverage {
    String getDescription();
    double cost();
}

// Concrete Component
class Coffee implements Beverage {
    public String getDescription() { return "Coffee"; }
    public double cost() { return 2.0; }
}

// Decorator
abstract class AddOn implements Beverage {
    protected Beverage beverage;
    AddOn(Beverage b) { beverage = b; }
}

// Concrete Decorators
class Milk extends AddOn {
    Milk(Beverage b) { super(b); }
    public String getDescription() { return beverage.getDescription() + ", Milk"; }
    public double cost() { return beverage.cost() + 0.5; }
}

// Usage
public class DecoratorPatternDemo {
    public static void main(String[] args) {
        Beverage coffee = new Milk(new Coffee());
        System.out.println(coffee.getDescription() + " = $" + coffee.cost());
    }
}
