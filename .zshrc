alias fetch='screenfetch'
alias update='sudo apt-get update && sudo apt-get dist-upgrade --no-install-recommends'
alias faces='/Users/alex/Scripts/faces.sh'
alias invaders='/Users/alex/Scripts/invaders.sh'
alias pipes='/Users/alex/Scripts/pipes.sh'
alias clean='sudo apt-get autoremove && sudo apt-get autoclean'
alias install='sudo apt-get install --no-install-recommends'
alias purge='sudo apt-get purge'
alias pacman='/usr/local/bin/scripts/pacman.sh'

echo -e "\e[1;37m Welcome back to Terminus, Kupo! I sure do hope you enjoy your stay \e[0m"

#!/bin/bash
alias space='/bin/space.sh'
alias color='/bin/color.sh'
alias rain='/bin/rain.sh'
alias pipes='/bin/pipes.sh'
alias kupo='toilet --gay kupo kupo
alias sup='toilet --gay sup /g/
alias pipes='/home/kupo/scripts/pipes.sh'


#!/bin/sh
# ANSI Color -- use these variables to easily have different color
# and format output. Make sure to output the reset sequence after
# colors (f = foreground, b = background), and use the 'off'
# feature for anything you turn on.
initializeANSI()
{
esc=""
blackf="${esc}[30m"; redf="${esc}[31m"; greenf="${esc}[32m"
yellowf="${esc}[33m" bluef="${esc}[34m"; purplef="${esc}[35m"
cyanf="${esc}[36m"; whitef="${esc}[37m"
blackb="${esc}[40m"; redb="${esc}[41m"; greenb="${esc}[42m"
yellowb="${esc}[43m" blueb="${esc}[44m"; purpleb="${esc}[45m"
cyanb="${esc}[46m"; whiteb="${esc}[47m"
boldon="${esc}[1m"; boldoff="${esc}[22m"
italicson="${esc}[3m"; italicsoff="${esc}[23m"
ulon="${esc}[4m"; uloff="${esc}[24m"
invon="${esc}[7m"; invoff="${esc}[27m"
reset="${esc}[0m"
}
# note in this first use that switching colors doesn't require a reset
# first - the new color overrides the old one.
initializeANSI
cat << EOF
${blackf}████${reset}${boldon}${blackf}████${reset} ${redf}████${reset}${boldon}${redf}████${reset} ${greenf}████${reset}${boldon}${greenf}████${reset} ${yellowf}████${reset}${boldon}${yellowf}████${reset} ${bluef}████${reset}${boldon}${bluef}████${reset} ${purplef}████${reset}${boldon}${purplef}████${reset} ${cyanf}████${reset}${boldon}${cyanf}████${reset} ${whitef}████${reset}${boldon}${whitef}████${reset}
${blackf}████${reset}${boldon}${blackf}████${reset} ${redf}████${reset}${boldon}${redf}████${reset} ${greenf}████${reset}${boldon}${greenf}████${reset} ${yellowf}████${reset}${boldon}${yellowf}████${reset} ${bluef}████${reset}${boldon}${bluef}████${reset} ${purplef}████${reset}${boldon}${purplef}████${reset} ${cyanf}████${reset}${boldon}${cyanf}████${reset} ${whitef}████${reset}${boldon}${whitef}████${reset}
${blackf}████${reset}${boldon}${blackf}████${reset} ${redf}████${reset}${boldon}${redf}████${reset} ${greenf}████${reset}${boldon}${greenf}████${reset} ${yellowf}████${reset}${boldon}${yellowf}████${reset} ${bluef}████${reset}${boldon}${bluef}████${reset} ${purplef}████${reset}${boldon}${purplef}████${reset} ${cyanf}████${reset}${boldon}${cyanf}████${reset} ${whitef}████${reset}${boldon}${whitef}████${reset}
EOF


#!/bin/bash
#
# Author: Twily     2014
#
# Useage: sh colors-hex -c|--case tolower|toupper -a|--align left|center|right -l|--line true|false -j|--jump <lines>

XPATH="/home/kupo/.Xdefaults"
CCASE="tolower"     # tolower|toupper
ULINE=true          # true|false
ALIGN="center"      # left|center|right
LIGHT=1             # 1|0 (highlight black color string)
JUMPL=2
CSYMB="  ◆ "
CFORM="URxvt.color"


OPTS=`getopt -o c:l:a:j: --long case:,line:,align:,jump: -- "$@"`
eval set -- "$OPTS"

while true; do
    case "$1" in
        -c|--case) CCASE="$2"; shift 2 ;;
        -l|--line) ULINE="$2"; shift 2 ;;
        -a|--align) ALIGN="$2"; shift 2 ;;
        -j|--jump) JUMPL="$2"; shift 2 ;;
        --) shift; break ;;
        *) echo "Internal error!"; exit 1
    esac
done

TXTLEN=$(echo "(8*6)+(8*${#CSYMB})"|bc)
TRMWTH=$(echo -e "lines\ncols"|tput -S|sed -n 2p)

XRES="`cat $XPATH`"

for i in $(seq 0 $(echo $JUMPL-1|bc)); do echo -ne "\n"; done

case "$ALIGN" in
    "left") ;;
    "center") for i in $(seq 0 $(echo "(($TRMWTH-1)/2)-($TXTLEN/2)-(${#CSYMB}/2)"|bc)); do echo -ne " "; done ;;
    "right") for i in $(seq 0 $(echo "(($TRMWTH-1))-($TXTLEN)-(${#CSYMB}/2)"|bc)); do echo -ne " "; done ;;
esac
echo -ne "\033[1;30m$CSYMB\033[1;30m"$(echo "$XRES"|grep $CFORM'8:'|egrep -o '[^#]+'|sed -n 2p|awk '{print '$CCASE'($0)}')
for i in {9..15}; do
    echo -ne "\033[1;3"$(echo $i-8|bc)"m$CSYMB"$(echo "$XRES"|grep $CFORM$i':'|egrep -o '[^#]+'|sed -n 2p|awk '{print '$CCASE'($0)}')
done

echo -ne "\n"

case "$ALIGN" in
    "left") ;;
    "center") for i in $(seq 0 $(echo "(($TRMWTH-1)/2)-($TXTLEN/2)-(${#CSYMB}/2)"|bc)); do echo -ne " "; done ;;
    "right") for i in $(seq 0 $(echo "(($TRMWTH-1))-($TXTLEN)-(${#CSYMB}/2)"|bc)); do echo -ne " "; done ;;
esac
echo -ne "\033[0;30m$CSYMB\033[$LIGHT;30m"$(echo "$XRES"|grep $CFORM'0:'|egrep -o '[^#]+'|sed -n 2p|awk '{print '$CCASE'($0)}')
for i in {1..7}; do
    echo -ne "\033[0;3"$i"m$CSYMB"$(echo "$XRES"|grep $CFORM$i':'|egrep -o '[^#]+'|sed -n 2p|awk '{print '$CCASE'($0)}')
done

echo -ne "\n"

if $ULINE; then
    echo -ne "\033[1;30m"
    for i in $(seq 0 $(echo $TRMWTH-1|bc)); do echo -ne "─"; done
fi

echo -ne "\n"



