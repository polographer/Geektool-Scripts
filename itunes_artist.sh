#!/bin/sh
arch -i386 osascript << EOT 
tell application "iTunes"
	if player state is playing then
		set trk to current track
	end if
	set {art, nom} to {trk's artist, trk's name}
	return art & " / " & nom
end tell
EOT
