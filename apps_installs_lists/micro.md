# Install new micro in server

```bash
wget https://github.com/zyedidia/micro/releases/download/v2.0.13/micro-2.0.13-linux64.tar.gz
tar -xvzf micro-2.0.13-linux64.tar.gz micro-2.0.13/micro
mv micro-2.0.13/micro ./micro
```

now move the micro to /usr/local/bin or ~/.local/bin

# Make micro default terminal editor

Add the following lines to the `~/.bashrc`

```bash
export EDITOR="micro"
export VISUAL="micro"
```

# Allow micro to create parent paths to newfiles

Add the following line to `~/.config/micro/settings.json` json file.

```json
{
    "mkparents": true
}
```
