// Mediator
interface ChatMediator {
    void sendMessage(String msg, User user);
}

// Concrete Mediator
class ChatRoom implements ChatMediator {
    public void sendMessage(String msg, User user) {
        System.out.println(user.getName() + ": " + msg);
    }
}

// Colleague
abstract class User {
    protected ChatMediator mediator;
    protected String name;
    User(String name, ChatMediator mediator) {
        this.name = name; this.mediator = mediator;
    }
    String getName() { return name; }
    abstract void send(String msg);
}

// Concrete Colleague
class ChatUser extends User {
    ChatUser(String name, ChatMediator mediator) { super(name, mediator); }
    void send(String msg) { mediator.sendMessage(msg, this); }
}

// Usage
public class MediatorPatternDemo {
    public static void main(String[] args) {
        ChatMediator room = new ChatRoom();
        User alice = new ChatUser("Alice", room);
        alice.send("Hello everyone!");
    }
}
