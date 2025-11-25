package ui;

import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.scene.layout.StackPane;
import javafx.stage.Stage;

/**
 * Minimal JavaFX entry point so the shaded jar can be built and launched.
 * Replace this stub with the real CTB Recorder entrance once available.
 */
public class CamrecApplication extends Application {
    @Override
    public void start(Stage stage) {
        StackPane root = new StackPane(new Label("CamrecApplication placeholder"));
        Scene scene = new Scene(root, 400, 200);
        stage.setScene(scene);
        stage.setTitle("CamrecApplication Stub");
        stage.show();
    }

    public static void main(String[] args) {
        launch(args);
    }
}
