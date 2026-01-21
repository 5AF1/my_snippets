# Install cargo first

```bash
curl https://sh.rustup.rs -sSf | sh
```

## Now yazi

if newly installed cargo just go to a new terminal or use `source ~/.bashrc`.

```bash
rustup update
git clone https://github.com/sxyazi/yazi.git
cd yazi
cargo build --release --locked
```

now just move the executables to local bin either global or user local

```bash
mv target/release/yazi target/release/ya /usr/local/bin/

# or

mv target/release/yazi target/release/ya ~/.local/bin
```

### suggestions

add the following to `~/.bashrc` for best usage

```bash
# >>> yazi helper function >>>
function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    IFS= read -r -d '' cwd < "$tmp"
    [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
    rm -f -- "$tmp"
}
# <<< yazi helper function <<<
```
for some personalized view create the following files at `~/.config/yazi` and fill them with the code given below

```toml
# ~/.config/yazi/yazi.toml
[manager]
show_hidden = true
sort_by = "size"
linemode = "size_and_mtime"

```

```lua
-- ~/.config/yazi/init.lua
function Linemode:size_and_mtime()
    local time = math.floor(self._file.cha.mtime or 0)
    if time == 0 then
        time = ""
    elseif os.date("%Y", time) == os.date("%Y") then
        time = os.date("%b %d %H:%M", time)
    else
        time = os.date("%b %d  %Y", time)
    end

    local size = self._file:size()
    local owner = ya.user_name(self._file.cha.uid)
    return string.format("%s %s %s", size and ya.readable_size(size) or "-", time, owner)
end

Status:children_add(function()
    local h = cx.active.current.hovered
    if h == nil or ya.target_family() ~= "unix" then
        return ""
    end

    return ui.Line {
        ui.Span(ya.user_name(h.cha.uid) or tostring(h.cha.uid)):fg("magenta"),
        ":",
        ui.Span(ya.group_name(h.cha.gid) or tostring(h.cha.gid)):fg("magenta"),
        " ",
    }
end, 500, Status.RIGHT)

require("zoxide"):setup {
        update_db = true,
}

```
