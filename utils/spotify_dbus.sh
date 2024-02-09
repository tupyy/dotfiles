#!/bin/bash

if [ -z "$(pidof spotify)" ]
	then echo "Spotify is not running."
	exit 1
fi

usage="Usage : $0 [playpause next prev title artist album]"

if [ $# -ne 1 ]
	then echo $usage
	exit 1
fi

playpause='dbus-send --type=method_call --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause'
next='dbus-send --type=method_call --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next'
prev='dbus-send --type=method_call --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous'
get_metadata="dbus-send --print-reply --dest=com.spotify.qt / org.freedesktop.DBus.Properties.Get string:org.freedesktop.MediaPlayer2 string:Metadata"

line_artist=22
line_album=17
line_title=39

if [ $1 == "title" ]
	then $get_metadata | sed -n "$line_title p" | grep -o '".*"' | sed s/\"//g
elif [ $1 == "artist" ]
	then $get_metadata | sed -n "$line_artist p" | grep -o '".*"' | sed s/\"//g
elif [ $1 == "album" ]
	then $get_metadata | sed -n "$line_album p" | grep -o '".*"' | sed s/\"//g
elif [ $1 == "playpause" ]
	then $playpause
elif [ $1 == "next" ]
	then $next
elif [ $1 == "prev" ]
	then $prev
else
	echo $usage
	exit 1
fi
