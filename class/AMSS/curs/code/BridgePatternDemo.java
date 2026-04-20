// Implementor
interface Device {
    void turnOn();
    void turnOff();
}

// Concrete Implementors
class TV implements Device {
    public void turnOn() { System.out.println("TV ON"); }
    public void turnOff() { System.out.println("TV OFF"); }
}

// Abstraction
abstract class Remote {
    protected Device device;
    Remote(Device d) { this.device = d; }
    abstract void toggle();
}

// Refined Abstraction
class SimpleRemote extends Remote {
    private boolean on = false;
    SimpleRemote(Device d) { super(d); }

    void toggle() {
        if (on) device.turnOff();
        else device.turnOn();
        on = !on;
    }
}

// Usage
public class BridgePatternDemo {
    public static void main(String[] args) {
        Remote remote = new SimpleRemote(new TV());
        remote.toggle();
        remote.toggle();
    }
}
