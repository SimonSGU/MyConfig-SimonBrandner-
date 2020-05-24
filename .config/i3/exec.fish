#!/usr/bin/env fish

bash /home/simon/GIT/Other/dotfiles/desktop.sh & # Kill wallpaper
compton & # Start Compton
latte-dock & # Start latte-dock
bash /home/simon/.config/conky/conky.sh & # Start Conky
sleep 5
megasync & # Start MEGASync

fish ./background.fish # Set background &

davmail & # Start Davmail
bash /home/simon/.config/i3/davmail.sh & # Start davmail and remove ~/davmail.log*
rm ~/core # Remove the core file
#barrier" # Start Barrier


# Workspace 0
i3-msg 'workspace 0; append_layout /home/simon/.config/i3/workspace-0.json' & # Set layout workspace 0
/opt/viber/Viber %u & # Start Viber
bash -lic 'LD_PRELOAD=/home/simon/GIT/NotMine/spotifywm/spotifywm.so /usr/bin/spotify' & # Start Spotify
discord & # Start Discord
whatsdesk & # Start whatsdesk
bash -lic 'LD_PRELOAD=/home/simon/GIT/NotMine/android-messageswm/android-messageswm /home/simon/PortableApps/AndroidMessages/android-messages' & # Start Android Messages
/home/simon/PortableApps/nativefier-apps/todoist-linux-x64/todoist --no-sandbox & # Start Todoist
thunderbird & # Start Thunderbird
#zoom & # Start Zoom
# Workspace 0