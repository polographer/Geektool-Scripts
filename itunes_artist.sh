#!/bin/sh
# if you had adobe master collection, this installs some plugins
# to osascript but only for 32 bits, if you are running on 64 bits
# the osascript will simply break, the arch parameter, is to tell osascript
# to run on 32 bits no matter what kernel are you running
# this only gets the artist name and song title
arch -i386 osascript << EOT 
tell application "iTunes"
	if player state is playing then
		set trk to current track
	end if
	set {art, nom} to {trk's artist, trk's name}
	return art & " / " & nom
end tell
EOT
