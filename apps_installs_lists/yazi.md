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
