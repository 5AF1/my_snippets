# new session

```bash
tmux new-session -A -s session_name
```

## scrolling

add the following to `~/.tmux.conf`

```yaml
set -g mouse on
```

Also run `tmux source ~/.tmux.conf` to confirm change in configuration.

## quick exit
ctrl + B D

## tmux idle kill prevention

add the following to `~/.bashrc`

```bash
# >>> tmux keep safi >>>
export TMOUT=0
# <<< tmux keep safi <<<
```
