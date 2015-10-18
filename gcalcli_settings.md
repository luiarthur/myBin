# gcalcli

[gcalcli](https://github.com/insanum/gcalcli) is allows you to access your
Google calendar through the command line. I started using it because I 
use a rather slow laptop for my work at school, which works great when
I ssh onto a server to work, but was slow at loading graphics (such as
even simple ones from Google calendar). gcalcli works great for my purposes.
Here are a few things I did to spice up my gcalcli.

Put into a repo:

- `.tmux.conf` settings
- `.bashrc.local` aliases
- `gcal`, `gcalbird`, `ok` scripts in `~/bin`

### TMUX settings
add these lines to ~/.tmux.conf
> \# gcalcli:  
> set-option -g status-interval 60  
> set-option -g status-left-length 30  
> set-option -g status-left " #[fg=colour123,bold]#(gcal -d | head -2 | tail -1 | cut -d ' ' -f 8-) #[default] | "  

### bashrc settings
> \# gcalcli:  
> alias gcalqa="gcalcli quick --calendar='Personal' --duration 0"  
> alias gcaladd="gcalcli add --calendar='Personal'"  
> alias gcalrm="gcalcli delete"  
> alias gcalls="gcalcli list"  
> alias gcalw="gcalcli calw"  
> alias gcaledit="gcalcli edit"  
> export GREP_COLOR='00;38;5;226'  

### scripts
Put this executable in `~/bin/gcal`
> \#!/bin/bash  
> \# Script to show my google calendar  
> \# See: http://wiki.bash-hackers.org/howto/getopts_tutorial  
>   
> MORNING=\`date +"%d/%m/%yT00:00"\`  
> CURRENT_TIME=\`date +"%d/%m/%yT%H:%M"\`  
> MIDNIGHT=\`date +"%d/%m/%yT23:59"\`  
>   
> EXE="gcalcli agenda $CURRENT\_TIME $MIDNIGHT"  
> DONE="0"  
>   
> while getopts :d opt; do  
>   case $opt in  
>     d)  
>       gcalcli agenda $CURRENT\_TIME $MIDNIGHT --detail\_location --detail\_length --detail\_description   
>       DONE="1"  
>       ;;  
>     \?)  
>       echo "Invalid option: -$OPTARG" >&2  
>       DONE="1"  
>       ;;  
>   esac  
> done  
>   
> if [ "$DONE" -eq "0" ]  
> then  
>   gcalcli agenda $MORNING $MIDNIGHT  
> fi  
>   
> exit 0  


Put this executable in `~/bin/gcalbird`
> \#!/bin/bash  
> \# Script to show my google calendar  
> \# See: http://wiki.bash-hackers.org/howto/getopts_tutorial  
>   
> PRESENT=\`date +"%d/%m/%y"\`  
> PAST=\`date +"%d/%m/%y" -d "-1 day"\`  
> FUTURE=\`date +"%d/%m/%y" -d "+4 day"\`  
>   
> gcalcli agenda $PAST $FUTURE --calendar='UCSC' --calendar='Personal' | grep --color -C100 "$(date +"%a %b %e")\|Due"  


Put this executable in `~/bin/ok`
> \#!/bin/bash  
>  
> \#tmux split-window -h -p 70  
> \#tmux send-keys -t 0 "  
> \#clear  
> \#echo; cal -h | grep -C6 --color "$(date +%e)"; gcalbird  
> \#"  
>  
> tmux new -d -s gcal-session  
> tmux send-keys -t gcal-session "  
> tmux split-window -h -p 70  
> clear  
> echo; cal -h | grep -C6 --color "$(date +%e)"; gcalbird  
> "  
> tmux attach -t gcal-session  

