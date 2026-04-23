interface State {
    void play(Player player);
    void pause(Player player);
    void stop(Player player);
}

class PlayingState implements State {
    public void play(Player player) {
        System.out.println("Already playing");
    }
    public void pause(Player player) {
        System.out.println("Pausing playback");
        player.setState(new PausedState());
    }
    public void stop(Player player) {
        System.out.println("Stopping playback");
        player.setState(new StoppedState());
    }
}

class PausedState implements State {
    public void play(Player player) {
        System.out.println("Resuming playback");
        player.setState(new PlayingState());
    }
    public void pause(Player player) {
        System.out.println("Already paused");
    }
    public void stop(Player player) {
        System.out.println("Stopping from paused state");
        player.setState(new StoppedState());
    }
}

class StoppedState implements State {
    public void play(Player player) {
        System.out.println("Starting playback");
        player.setState(new PlayingState());
    }
    public void pause(Player player) {
        System.out.println("Can't pause, player is stopped");
    }
    public void stop(Player player) {
        System.out.println("Already stopped");
    }
}

class Player {
    private State state;

    public Player() {
        this.state = new StoppedState();
    }

    public void setState(State state) {
        this.state = state;
    }

    public void play() {
        state.play(this);
    }

    public void pause() {
        state.pause(this);
    }

    public void stop() {
        state.stop(this);
    }
}

public class StatePatternDemo {
    public static void main(String[] args) {
        Player player = new Player();
        player.play();
        player.pause();
        player.stop();
    }
}
