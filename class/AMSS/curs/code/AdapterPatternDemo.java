// Target interface
interface MediaPlayer {
    void play(String file);
}

// Adaptee
class LegacyPlayer {
    void playMp3(String filename) {
        System.out.println("Playing MP3: " + filename);
    }
}

// Adapter
class MediaAdapter implements MediaPlayer {
    private LegacyPlayer legacy = new LegacyPlayer();
    public void play(String file) { legacy.playMp3(file); }
}

// Usage
public class AdapterPatternDemo {
    public static void main(String[] args) {
        MediaPlayer player = new MediaAdapter();
        player.play("song.mp3");
    }
}
