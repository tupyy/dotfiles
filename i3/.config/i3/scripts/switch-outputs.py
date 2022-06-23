#!/usr/bin/env python

from json import loads
from os import popen
from sys import argv

def ipc_query(req="command", msg=""):
    ans = popen("i3-msg -t " + req + " " +  msg).readlines()[0]
    return loads(ans)

if __name__ == "__main__":
    if len(argv) != 3:
        print("Usage: switch-workspace.py source_display target_display")
        exit(-1)

    source_display = argv[1]
    target_display = argv[2]

    # Retrieving active display
    active_display = None
    for w in ipc_query(req="get_workspaces"):
        if w['output'] == source_display:
            ipc_query(msg="'workspace " + w['name'] + "; move workspace to output " + target_display + "'")

    # Moving workspace to active display

