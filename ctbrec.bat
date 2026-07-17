@echo off
bin\java.exe -Xmx4g -Dctbrec.config.dir=.\config -Dfile.encoding=UTF-8 --add-modules javafx.controls,javafx.media,javafx.swing --add-opens javafx.controls/com.sun.javafx.scene.control.behavior=ALL-UNNAMED -jar target\ctbrec-1.0-SNAPSHOT-shaded.jar
