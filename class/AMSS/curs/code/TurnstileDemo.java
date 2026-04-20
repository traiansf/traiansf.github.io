class Turnstile {
    private State state = new Locked(this);
    void setState(State s) { state = s; }
    void coin() { state.handleCoin(); }
    void push() { state.handlePush(); }
}

class State {
    Turnstile turnstile;
    State(Turnstile turnstile) {
        this.turnstile = turnstile;
    }
    public void handleCoin() {
        printState();
        System.out.println("Trigger: Coin inserted!");
    }
    public void handlePush() {
        printState();
        System.out.println("Trigger: Push attempted!");
    }
    void printState() {
        System.out.println("State: ".concat(this.getClass().getName()));
    }
}

class Locked extends State {
    Locked(Turnstile turnstile) {
        super(turnstile);
    }
    public void handleCoin() {
        super.handleCoin();
        unlock();
        turnstile.setState(new Unlocked(this.turnstile));
    }
    public void handlePush() {
        super.handlePush();
        System.out.println("Action: You shall not pass!");   
    }
    void unlock() {
        System.out.println("Action: Turnstile unlocked");
    }
}

class Unlocked extends State {
    Unlocked(Turnstile turnstile) {
        super(turnstile);
    }
    public void handleCoin() {
        super.handleCoin();
        System.out.println("Action: Turnstile already unlocked. returning coin.");   
    }
    public void handlePush() {
        super.handlePush();
        System.out.println("\tPerson passed.");   
        lock();
        turnstile.setState(new Locked(this.turnstile));
    }
    void lock() {
        System.out.println("Action: Turnstile locked");
    }
}

public class TurnstileDemo {
    public static void main(String[] args) {
        Turnstile t = new Turnstile();
        t.coin();
        t.push();
        t.coin();
        t.push();
        t.coin();
        t.coin();
        t.push();
        t.push();
    }
}