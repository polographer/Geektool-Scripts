#!/bin/sh
# one to rule them all !
# if you had adobe master collection, this installs some plugins
# to osascript but only for 32 bits, if you are running on 64 bits
# the osascript will simply break, the arch parameter, is to tell osascript
# to run on 32 bits no matter what kernel are you running
# first it gets the artist name and song title, later the lyrics
arch -i386 osascript << EOF 
if appIsRunning("iTunes") then
	tell application "iTunes"
		if player state is playing then
			set trk to current track
			set {art, nom} to {trk's artist, trk's name}
			return art & " / " & nom
		end if
	end tell
else
end if
on appIsRunning(appName)
	tell application "System Events" to (name of processes) contains appName
end appIsRunning
EOF
echo "\r"

arch -i386 osascript << EOT 
if appIsRunning("iTunes") then
	tell application "iTunes"
		if player state is playing then
			set trk to current track
			set the_lyrics to trk's lyrics
			return the_lyrics
		end if
	end tell
end if

on appIsRunning(appName)
	tell application "System Events" to (name of processes) contains appName
end appIsRunning

EOT
