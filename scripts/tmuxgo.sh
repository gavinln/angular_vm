#!/bin/bash
# type ^bd to detach from session
# type ^b[ to enable scrolling

# the name of your primary tmux session
SESSION=$USER

# check if tmux is running
RESULT=`pgrep tmux`
if [ -z $RESULT ]; then
    # if the session is already running, just attach to it.
    tmux has-session -t $SESSION
    if [ $? -eq 0 ]; then
        echo "Session $SESSION already exists. Attaching."
        sleep 1
        tmux attach -t $SESSION
    fi
else
    tmux new-session -d -s $SESSION 'cd /srv/share/ga_proj; zsh'
    tmux split-window -p 50 -d 'cd /srv/share/ga_proj; zsh'
    tmux select-pane -t 0
    tmux attach-session -t $SESSION
fi
