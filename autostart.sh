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
 
## mixer
 (pnmixer) &
 
## Volume keys daemon
xfce4-volumed &
 
 
## Start Gnome Policy Kit
/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &

## X11 Compostier
(sleep 2s && compton) &

## terminal
rxvt-unicode &
