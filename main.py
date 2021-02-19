import sys
from time import strftime, gmtime, sleep
import threading

from PyQt5.QtGui import QGuiApplication
from PyQt5.QtQml import QQmlApplicationEngine
from PyQt5.QtCore import QObject, pyqtSignal

class Backend(QObject):

    def __init__(self):
        QObject.__init__(self)

    updated = pyqtSignal(str, arguments=['updater'])

    def updater(self, curr_time):
        self.updated.emit(curr_time)

    def bootUp(self):
        t_thread = threading.Thread(target=self._bootUp)
        t_thread.daemon = True
        t_thread.start()
    
    def _bootUp(self):
        while True:
            curr_time = strftime('%H:%M:%S', gmtime())
            print(curr_time)
            sleep(1)

# Der obige Code importiert QObject und pyqtSignal, in pyside heißt dies Signal. 
# Es ist einer der wenigen Unterschiede zwischen Pyqt und Pyside.

# curr_time = strftime('%H:%M:%S', gmtime())




app = QGuiApplication(sys.argv)

engine = QQmlApplicationEngine()
engine.quit.connect(app.quit)
engine.load('./UI/main.qml')
back_end = Backend()
engine.rootObjects()[0].setProperty('backend', back_end) # aktuelle Zeit permanent übergeben
# engine.rootObjects()[0].setProperty('currTime', curr_time) # aktuelle Zeit an das Fenster übergeben
back_end.bootUp()



sys.exit(app.exec())