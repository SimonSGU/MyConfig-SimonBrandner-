#!/usr/bin/env fish

compton & # Start Compton
latte-dock & # Start latte-dock
bash /home/simon/.config/conky/conky.sh & # Start Conky
sleep 5
megasync & # Start MEGASync
#ulauncher & # Start MEGASync

rm ~/core # Remove the core file
#barrier" # Start Barrier


# Workspace 0
i3-msg 'workspace 0; append_layout ./i3Layouts/workspace-0.json' & # Set layout workspace 0
/opt/viber/Viber %u & # Start Viber
spotify & # Start Spotify
discord & # Start Discord
#whatsdesk --no-sandbox & # Start Whatsdesk
bash -lic 'LD_PRELOAD=/home/simon/GIT/NotMine/android-messageswm/android-messageswm /home/simon/PortableApps/AndroidMessages/android-messages' & # Start Android Messages
/home/simon/PortableApps/nativefier-apps/todoist-linux-x64/todoist --no-sandbox & # Start Todoist
teams & # Start MS Teams
evolution & # Start Evolution
variety &
# Workspace 0  
