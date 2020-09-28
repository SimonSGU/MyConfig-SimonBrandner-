#!/usr/bin/zsh

#loginctl lock-session # Lock screen

# Setup background apps
############################################################
#latte-dock & # Start LatteDock
#barrier" # Start Barrier
compton & # Start Compton
bash /home/simon/.config/conky/conky.sh & # Start Conky
sleep 5
megasync & # Start MEGASync
variety -n & # Start Variety
############################################################
# Setup background apps

# Cleanup
############################################################
rm ~/core # Remove the core file
############################################################
# Cleanup


# Setup Workspace 0
############################################################
i3-msg 'workspace 0; append_layout /home/simon/GIT/Other/dotfiles/i3Layouts/workspace-0.json' & # Set layout workspace 0
bash -lic 'LD_PRELOAD=/home/simon/GIT/NotMine/android-messageswm/android-messageswm /home/simon/PortableApps/AndroidMessages/android-messages' & # Start Android Messages
/home/simon/PortableApps/nativefier-apps/todoist-linux-x64/todoist --no-sandbox & # Start Todoist
evolution & # Start Evolution
#whatsdesk --no-sandbox & # Start Whatsdesk

# Wait for PulseAudio
while ! pgrep pulseaudio; do sleep 1; done
sleep 1
# Wait for PulseAudio

spotify &
/opt/viber/Viber & # Start Viber
discord & # Start Discord
teams & # Start MS Teams
############################################################
# Setup Workspace 0
