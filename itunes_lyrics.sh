#!/bin/sh
#arch -i386 osascript script.scpt
# if you had adobe master collection (or adobe software), this installs some plugins
# to osascript but only for 32 bits, if you are running on 64 bits
# the osascript will simply break, the arch parameter, is to tell osascript
# to run on 32 bits no matter what kernel are you running
# this only gets the lyrics
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
