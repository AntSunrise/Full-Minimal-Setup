## tint panel
(sleep 2s && tint2) &
  
  
## Enable power management
xfce4-power-manager &
  
## Start Thunar Daemon
thunar --daemon &
  
  
## Start xscreensaver
xscreensaver -no-splash &
  
  
## Set keyboard settings - 250 ms delay and 25 cps (characters per second) repeat rate.
## Adjust the values according to your preferances.
xset r rate 250 25 &
  
## nitrogen
(nitrogen --restore) &&
  
  
## Volume keys daemon
xfce4-volumed &
  
  
## Start Gnome Policy Kit
/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &

## Compoister
compton &

## polkit
polkit-gnome &

## Octopi-notofier
(sleep 5s && octopi-notifier) &

## MPD
(sleep 3s && mpd) &

