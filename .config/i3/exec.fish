#!/usr/bin/env fish

compton & # Start Compton
bash /home/simon/.config/i3/conky.sh & # Start Conky
megasync & # Start MEGASync

davmail & # Start Davmail
bash /home/simon/.config/i3/davmail.sh & # Start davmail and remove ~/davmail.log*
rm ~/core # Remove the core file
#barrier" # Start Barrier


# Workspace 0
i3-msg 'workspace 0; append_layout /home/simon/.config/i3/workspace-0.json' & # Set layout workspace 0

/opt/viber/Viber %u & # Start Viber
bash -lic 'LD_PRELOAD=/media/Linux-HDD-Data/GIT/spotifywm/spotifywm.so /usr/bin/spotify' & # Start Spotify
discord & # Start Discord
whatsdesk & # Start WhatsDesk
bash -lic 'LD_PRELOAD=/home/simon/GITLink/android-messageswm/android-messageswm /home/simon/MediaLink/Linux-HDD-Data/PortableApps/AndroidMessages/android-messages' & # Start Android Messages
/home/simon/GITLink/nativefier/apps/todoist-linux-x64/todoist --no-sandbox & # Start Todoist
thunderbird & # Start Thunderbird
# Workspace 0