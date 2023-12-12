# This Python file uses the following encoding: utf-8
import sys
from pathlib import Path

from PySide6.QtGui import QGuiApplication, QIcon
from PySide6.QtQml import QQmlApplicationEngine


if __name__ == "__main__":
    QGuiApplication.setApplicationName("Vision")
    QGuiApplication.setOrganizationName("ParsAI")

    qml_file = Path(__file__).resolve().parent / "main.qml"

    app = QGuiApplication(sys.argv)

    engine = QQmlApplicationEngine()
    engine.load(qml_file)

    rootObjects = engine.rootObjects()

    if not engine.rootObjects():
        sys.exit(-1)

    window = rootObjects[0]
    window.setIcon(QIcon('Icons/logo.png'))

    sys.exit(app.exec())
