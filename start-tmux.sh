#!/bin/zsh

source "${0:a:h}/.common.sh"

function initiate-tmux() {
  # Initiate with TmuxSessionName
  new-session;

  # Initiate window 0
  Window0=$TmuxSessionName:0
  splitwh-setup $Window0 '.' \
      'ps aux' \
      'ls -la' \
  ;
  setup-window $Window0;
  rename-window $Window0 'Window 0';

  # Initiate window 1
  Window1=$TmuxSessionName:1
  new-window-splitwh-setup $Window1 '.' 'Window 1' \
      'echo left' \
      'echo right' \
  ;

  select-window $Window0;
}

if ! is-initiated; then
  initiate-tmux
fi

attach-tmux
