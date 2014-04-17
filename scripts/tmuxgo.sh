#!/bin/bash
# type ^bd to detach at the end of the day 

# the name of your primary tmux session
SESSION=$USER

# if the session is already running, just attach to it.
tmux has-session -t $SESSION
if [ $? -eq 0 ]; then
    echo "Session $SESSION already exists. Attaching."
    sleep 1
    tmux attach -t $SESSION
    exit 0;
fi

# create a new session, named $SESSION, and detach from it
tmux new-session -d -s $SESSION 'cd /vagrant/js; grunt serve'

# Now populate the session with the windows you use every day
tmux split-window -p 50 -d 'cd /vagrant/js; /vagrant/scripts/karma_jasmine.sh'

tmux select-pane -t 1

tmux attach-session -t $SESSION
