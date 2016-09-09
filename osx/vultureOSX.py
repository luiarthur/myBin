#!/usr/bin/env python

import sys, os, time
from watchdog.observers import Observer
from watchdog.events import PatternMatchingEventHandler

if len(sys.argv) < 3:
    print "Usage:    ./vultureOSX fileToWatch cmdToExecute"
    sys.exit(1)

fullpath = sys.argv[1]
cmd = ' '.join( str(s) for s in sys.argv[2:] )
path = "." if os.path.dirname(fullpath) == "" else os.path.dirname(fullpath) + "/"
fname = os.path.basename(fullpath)
ext = os.path.splitext(fname)[1]

os.system (cmd)
print "######################### Changes made at: "+ path + "/" + fname +" #########################"

class MyHandler(PatternMatchingEventHandler):
    patterns = ["*"+ext]
    def on_created(self, event):
        os.system (cmd)
        print "######################### Changes made at: "+event.src_path +" #########################"

observer = Observer()
observer.schedule(MyHandler(), path, recursive=False)
observer.start()
try:
    while True:
        time.sleep(1)
except KeyboardInterrupt:
    observer.stop()
observer.join()
