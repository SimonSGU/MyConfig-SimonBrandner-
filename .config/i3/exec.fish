#!/usr/bin/env fish

compton --blur-method kawase --blur-strength 10 --backend glx & # Start Compton
bash /home/simon/.config/i3/conky.sh & # Start Conky
megasync & # Start MEGASync

davmail & # Start Davmail
/home/simon/.config/i3/davmail.sh & # Remove ~/davmail.log*

#barrier" # Start Barrier


# Workspace 0
i3-msg 'workspace 0; append_layout /home/simon/.config/i3/workspace-0.json' & # Set layout workspace 0

/opt/viber/Viber %u & # Start Viber
bash -lic 'LD_PRELOAD=/media/Linux-HDD-Data/GIT/spotifywm/spotifywm.so /usr/bin/spotify' & # Start Spotify
discord & # Start Discord
whatsdesk & # Start WhatsDesk
bash -lic 'LD_PRELOAD=/home/simon/GITLink/android-messageswm/android-messageswm /home/simon/MediaLink/Linux-HDD-Data/PortableApps/Android\ Messages/android-messages' & # Start Android Messages
/home/simon/MediaLink/Linux-HDD-Data/PortableApps/Todoist/todoist & # Start Todoist
thunderbird & # Start Thunderbird
# Workspace 0