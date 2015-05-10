REM starts tmux automatically when connecting using ssh
vagrant ssh clone -- -t '. /etc/profile; . ~/.profile; /vagrant/scripts/tmuxgo.sh'
