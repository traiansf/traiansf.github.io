import java.util.*;

interface Observer {
    void update(float temperature);
}

interface Subject {
    void attach(Observer o);
    void detach(Observer o);
    void notifyObservers();
}

class WeatherStation implements Subject {
    private List<Observer> observers = new ArrayList<>();
    private float temperature;

    public void attach(Observer o) {
        observers.add(o);
    }

    public void detach(Observer o) {
        observers.remove(o);
    }

    public void setTemperature(float t) {
        this.temperature = t;
        notifyObservers();
    }

    public void notifyObservers() {
        for (Observer o : observers) {
            o.update(temperature);
        }
    }
}

class Display implements Observer {
    private String name;

    public Display(String name) {
        this.name = name;
    }

    public void update(float temperature) {
        System.out.println(name + " display: new temperature = " + temperature);
    }
}

public class ObserverPatternDemo {
    public static void main(String[] args) {
        WeatherStation station = new WeatherStation();
        Display d1 = new Display("Main");
        Display d2 = new Display("Secondary");

        station.attach(d1);
        station.attach(d2);

        station.setTemperature(25.0f);
        station.setTemperature(30.0f);
    }
}
