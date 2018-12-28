unbind C-b
set -g prefix `
bind ` send-prefix

set -g default-terminal 'tmux-256color'
set -ga terminal-overrides ",xterm-256color:Tc"
set -g history-limit 4096

bind r source-file ~/.tmux.conf

unbind '%'
unbind '"'
bind g split-window -v -c '#{pane_current_path}'
bind v split-window -h -c '#{pane_current_path}'
bind j select-pane -D
bind k select-pane -U
bind h select-pane -L
bind l select-pane -R
bind -r J resize-pane -D
bind -r K resize-pane -U
bind -r H resize-pane -L
bind -r L resize-pane -R

setw -g mode-keys vi
set -g status-keys vi

set -sg escape-time 0

set -g mouse on

set -g status on
set -g status-position bottom
set -g base-index 1
set -g pane-base-index 1
set -g set-titles on
set -g set-titles-string '#{pane_current_command}'
setw -g aggressive-resize on
set -g visual-activity on
setw -g monitor-activity off
set -g renumber-windows on

set -g pane-active-border-fg white
set -g pane-active-border-bg default
set -g pane-border-fg brightblack
set -g pane-border-bg default

set -g status-left ''
set -g status-right '#[fg=white,bg=brightblack] %b %d %Y #[fg=black,bg=white] %R '
set -g status-right-length 100
set -g status-bg default
setw -g window-status-format '#[fg=white,bg=black] #I  #W '
setw -g window-status-current-format '#[fg=white,bg=brightblack] #I #[fg=black,bg=white] #W '
