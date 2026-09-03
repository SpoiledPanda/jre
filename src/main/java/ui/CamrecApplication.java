package ui;

import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.scene.layout.StackPane;
import javafx.stage.Stage;

/**
 * Minimal JavaFX entry point used to verify that the shaded JAR can be built
 * and launched with the bundled runtime.
 *
 * <p>Replace this placeholder with the CTB Recorder application entry point
 * when its source is available.</p>
 */
public class CamrecApplication extends Application {
    /**
     * Creates and displays the placeholder application window.
     *
     * @param stage the primary stage supplied by the JavaFX runtime
     */
    @Override
    public void start(Stage stage) {
        StackPane root = new StackPane(new Label("CamrecApplication placeholder"));
        Scene scene = new Scene(root, 400, 200);
        stage.setScene(scene);
        stage.setTitle("CamrecApplication Stub");
        stage.show();
    }

    /**
     * Launches the JavaFX application.
     *
     * @param args command-line arguments passed to the JavaFX runtime
     */
    public static void main(String[] args) {
        launch(args);
    }
}
