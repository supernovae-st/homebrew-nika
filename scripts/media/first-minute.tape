# first-minute.tape — the moment right after `brew install`: the mirror
# greets the machine, then the first proof runs offline on the mock
# provider, zero keys. Every command is the released binary's own; the
# sandbox HOME (/tmp/you) is staged by scripts/media/render.sh. House
# theme = the engine's nika-hero palette.
Output first-minute.gif

Set Shell zsh
Set FontFamily "JetBrains Mono"
Set FontSize 21
Set Width 1420
Set Height 780
Set Padding 24
Set Theme { "name": "nika", "background": "#08090b", "foreground": "#dbe3ee", "cursor": "#4f86ff", "black": "#10131a", "red": "#ff6b6b", "green": "#34d399", "yellow": "#f0b45b", "blue": "#4f86ff", "magenta": "#b07bff", "cyan": "#22d3ee", "white": "#dbe3ee", "brightBlack": "#5b6472", "brightRed": "#ff8f8f", "brightGreen": "#5ee6b0", "brightYellow": "#ffd08a", "brightBlue": "#8db4ff", "brightMagenta": "#c9a2ff", "brightCyan": "#67e3f5", "brightWhite": "#ffffff" }
Set TypingSpeed 30ms
Set PlaybackSpeed 1.0

Hide
Type "export HOME=/tmp/you TMPDIR=/tmp && cd /tmp/you/demo && unset -m '*API_KEY*' '*_TOKEN*' '*SECRET*' 2>/dev/null; setopt interactive_comments && clear"
Enter
Show

Type "# just installed · meet the binary"
Enter
Sleep 600ms
Type "nika welcome"
Enter
Sleep 5400ms

Type "clear"
Enter
Type "# the first proof · offline · zero keys"
Enter
Sleep 700ms
Type "nika examples run 01-hello --model mock/echo"
Enter
Sleep 3200ms
Sleep 1400ms
