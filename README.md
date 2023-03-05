# Color prompt for Bash

This is the customized prompt that I use.

To install:

```bash
sudo wget https://github.com/DaviMedrade/color_prompt/raw/main/color_prompt.sh -O/etc/profile.d/color_prompt.sh
```

To activate:

```bash
. /etc/profile.d/color_prompt.sh
```

You'd probably have to add the line above at the end of `/etc/bashrc` (or `/etc/bash.bashrc`) and remove/comment out any lines assigning a value to `PS1` in your own `~/.bashrc`.
