#!/bin/sh
#arch -i386 osascript script.scpt
# osascript runs on 64 bits, and some adobe plugins are not working ...
arch -i386 osascript << EOT 
tell application "iTunes"
	if player state is playing then
		set trk to current track
	end if
	set the_lyrics to trk's lyrics
	return the_lyrics
end tell
EOT
