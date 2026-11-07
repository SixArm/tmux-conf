# tmux-conf

These are our tmux configuration files with annotations. We welcome feedback and pull requests.

* You can read the files to learn what they do, and we annotate the files to help explain.

* You can copy/paste any items that you like, from these files to your own `tmux.conf` file.

* You can source these files in your own `tmux.conf` file.


## How to install

Our files are in version directories, one for each tmux release from 1.9 through 3.8:

```txt
sources/1.9
sources/2.0
...
sources/3.8
```

Each version directory is complete: it has every file that works on that tmux version, plus an example `tmux.conf` that sources them. Pick the directory that matches your tmux version, which `tmux -V` prints.

Install:

```sh
git clone https://github.com/SixArm/tmux-conf.git
version=$(tmux -V | sed -E 's/^[^0-9]*([0-9]+\.[0-9]+).*/\1/')
mkdir -p $HOME/.config/tmux
cp -R tmux-conf/sources/$version/. $HOME/.config/tmux
```

This copies the example `tmux.conf` too:

* For tmux 3.1 and newer, tmux reads `~/.config/tmux/tmux.conf` when you don't have a `~/.tmux.conf` file.

* For tmux 3.2 and newer, the example finds the other files relative to its own location, so you can copy the files to any directory, such as `${XDG_CONFIG_HOME:-$HOME/.config}/tmux`.

* For tmux older than 3.2, the example sources the other files from `~/.config/tmux`.

* For tmux older than 3.1, tmux reads only `~/.tmux.conf`, so create it with this line: `source-file ~/.config/tmux/tmux.conf`

To check that the example `tmux.conf` loads without errors on your tmux version, run:

```sh
tmux-conf/bin/check
```

The check is meaningful only for the directory that matches your installed tmux, because older directories use syntax that newer tmux no longer accepts.


## Config file location

For the tmux configuration file location, we recommend changing from `~/.tmux.conf` to a more standard `${XDG_CONFIG_HOME:-$HOME/.config}/tmux/tmux.conf`. This follows the XDG Base Directory specification, keeps the file next to the files sourced here, and is supported by tmux 3.1 and newer.

```sh
mkdir -p "${XDG_CONFIG_HOME:-$HOME/.config}/tmux"
mv ~/.tmux.conf "${XDG_CONFIG_HOME:-$HOME/.config}/tmux/tmux.conf"
```


## How to source these files

You can use our example `tmux.conf` as is, or edit your own tmux configuration file, and add lines to it.

These files are in every version directory:

```tmux
source $HOME/.config/tmux/unbind-all-keys.conf                 # unbind every key, for a clean slate
source $HOME/.config/tmux/version.conf                         # store the tmux version in TMUX_VERSION
source $HOME/.config/tmux/platform.conf                        # store the platform in TMUX_PLATFORM
source $HOME/.config/tmux/prefix-is-control-a.conf             # prefix is C-a instead of C-b
source $HOME/.config/tmux/shell.conf                           # default shell, history, escape time
source $HOME/.config/tmux/reload-via-r.conf                    # prefix r reloads config
source $HOME/.config/tmux/mouse.conf                           # mouse mode on
source $HOME/.config/tmux/status.conf                          # status bar layout
source $HOME/.config/tmux/status-style-is-black-on-white.conf  # black-on-white status bar
source $HOME/.config/tmux/status-color-is-black-on-white.conf  # black-on-white status bar, via status-fg and status-bg
source $HOME/.config/tmux/status-via-powerline.conf            # status bar via powerline.sh, which must be installed
source $HOME/.config/tmux/base-index-pane-number-is-1.conf     # number windows and panes from 1
source $HOME/.config/tmux/split-window.conf                    # prefix | and _ split in the current directory
source $HOME/.config/tmux/select-pane-via-hjkl.conf            # prefix h j k l select a pane
source $HOME/.config/tmux/resize-pane-via-hjkl.conf            # prefix H J K L resize a pane
source $HOME/.config/tmux/select-layout-via-brackets.conf      # prefix [ and ] select even layouts, replacing copy mode
source $HOME/.config/tmux/select-window-via-meta-number.conf   # M-1 through M-9 select a window
source $HOME/.config/tmux/switch-session-via-name.conf         # prefix S switches session by name
source $HOME/.config/tmux/zoom-via-plus-minus.conf             # prefix + and - zoom and unzoom a pane
source $HOME/.config/tmux/copy-mode-via-vi-keys.conf           # vi keys in copy mode: v selects, y copies
source $HOME/.config/tmux/clipboard.conf                       # programs can copy to the system clipboard
source $HOME/.config/tmux/aggressive-resize.conf               # size windows to the smallest viewing client
```

These files are in the version directory for the tmux version shown and newer:

```tmux
source $HOME/.config/tmux/true-color.conf                    # 2.2: 24-bit color
source $HOME/.config/tmux/pane-border.conf                   # 3.2: heavy pane borders
source $HOME/.config/tmux/popup.conf                         # 3.2: prefix T opens a scratch shell popup
source $HOME/.config/tmux/extended-keys.conf                 # 3.2: extended keys such as Ctrl-Enter
source $HOME/.config/tmux/pane-border-indicators.conf        # 3.3: arrows at the active pane
source $HOME/.config/tmux/popup-border-lines.conf            # 3.3: rounded popup borders
source $HOME/.config/tmux/allow-passthrough.conf             # 3.3: let programs send escapes to the terminal
source $HOME/.config/tmux/hyperlinks.conf                    # 3.4: clickable OSC 8 hyperlinks
source $HOME/.config/tmux/prefix-timeout.conf                # 3.5: cancel the prefix key after 2 seconds
source $HOME/.config/tmux/allow-set-title.conf               # 3.5: stop programs from changing pane titles
source $HOME/.config/tmux/extended-keys-format.conf          # 3.5: extended keys in CSI u format
source $HOME/.config/tmux/initial-repeat-time.conf           # 3.6: a longer wait for the first repeat
source $HOME/.config/tmux/pane-scrollbars.conf               # 3.6: scrollbars beside each pane in copy mode
source $HOME/.config/tmux/copy-mode-styles.conf              # 3.6: selection and position styles in copy mode
source $HOME/.config/tmux/copy-mode-line-numbers.conf        # 3.7: relative line numbers in copy mode
source $HOME/.config/tmux/focus-follows-mouse.conf           # 3.7: select a pane by moving the mouse into it
source $HOME/.config/tmux/get-clipboard.conf                 # 3.7: programs can read the system clipboard
source $HOME/.config/tmux/theme.conf                         # 3.8: built-in light and dark themes
source $HOME/.config/tmux/copy-mode-current-line-style.conf  # 3.8: highlight the cursor line in copy mode
source $HOME/.config/tmux/pane-scrollbars-auto-hide.conf     # 3.8: scrollbars that auto-hide
```

Some of these files add settings to a related file, which their comments name. Source the related file first, such as:

```tmux
source $HOME/.config/tmux/copy-mode-via-vi-keys.conf
source $HOME/.config/tmux/copy-mode-line-numbers.conf
source $HOME/.config/tmux/copy-mode-current-line-style.conf
```

In tmux 3.8, mouse mode is on by default, prefix Tab opens a fast window switcher, prefix S-Tab opens a fast session switcher, and floating panes are available in an early release, via the `new-pane` command, which is bound to `prefix *` by default.


## Version-specific settings

We use version directories to help us run tmux on many systems, including systems where we can't easily upgrade tmux ourselves.

A version directory has no version checks inside its files, because the directory itself picks the version.

When a file is the same for many versions, then each version directory has its own copy.

When a setting needs different syntax on older tmux, the version directory has a file with the same name and the older syntax:

| File | Variants |
|---|---|
| `mouse.conf` | 1.9 and 2.0: `mode-mouse` and related options; 2.1: `mouse` and `mouse-utf8`; 2.2 and newer: `mouse` |
| `utf8.conf` | 1.9 through 2.1 only; tmux 2.2 removed the `utf8` options |
| `version.conf` | 1.9 through 3.1: parse `tmux -V`; 3.2 and newer: use `#{version}` |
| `copy-mode-via-vi-keys.conf` | 1.9 through 2.3: the `vi-copy` key table; 2.4 and newer: the `copy-mode-vi` key table |
| `platform-specific/darwin/copy-mode-via-pbcopy.conf` | 1.9 through 2.3: `copy-pipe`; 2.4 and newer: `copy-pipe-and-cancel` |
| `zoom-via-plus-minus.conf` | 1.9: both keys toggle the zoom; 2.0 and newer: `if-shell -F` picks zoom or unzoom |
| `status-style-is-black-on-white.conf` | 1.9 through 3.7: `black` and `white`; 3.8 and newer: theme colors |
| `reload-via-r.conf` | 1.9 through 3.1: reload `~/.config/tmux/tmux.conf`; 3.2 and newer: reload whichever conf file tmux started with, via `#{config_files}` |
| `true-color.conf` | 2.2 through 3.1: the `Tc` terminal override; 3.2 and newer: the `RGB` terminal feature |

For example, when we use version 2.2 or newer then we want to set the mouse like this:

```tmux
set -g mouse on
```


## Platform-specific settings

See the directory `platform-specific` inside each version directory.

We use platform-specific files to help us run tmux on many systems.

If you use macOS, then add these, and set your terminal to send Option as Meta (see `platform-specific/darwin/option-is-meta.md`):

```tmux
source $HOME/.config/tmux/platform-specific/darwin/tmux.conf                  # prefix y copies the tmux buffer to the clipboard
source $HOME/.config/tmux/platform-specific/darwin/copy-mode-via-pbcopy.conf  # copy mode y copies to the clipboard
source $HOME/.config/tmux/platform-specific/darwin/paste-via-pbpaste.conf     # prefix p pastes the clipboard
```

For example, when we use the macOS platform a.k.a. Darwin,
then we want this setting:

```tmux
# After copying to a tmux buffer, hit y again to copy to clipboard.
bind y run-shell "tmux save-buffer - | pbcopy"
```

## Testing

We test our files two ways.

`bin/lint` checks every version directory against the tmux source code of that release. It reads the source code as text, from GitHub, and caches it in `.cache/tmux-src`. It checks commands, flags, argument counts, option names, option scope, option values, copy mode commands, key names, format variables, colour names, terminal feature names, brace blocks, and `source-file` targets.

```sh
bin/lint            # lint every version directory
bin/lint 3.8 2.6    # lint the given version directories
```

`bin/check` loads a version directory's example `tmux.conf` in a separate tmux server, and reports any errors. This test is meaningful only for the directory that matches your installed tmux.

```sh
bin/check           # check the directory for your installed tmux
```

Our GitHub Actions workflow, `.github/workflows/test.yml`, runs `bin/lint`, and builds each tmux release from 1.9 through 3.8 from source, then runs `bin/check` for each release with its own tmux. So every version directory gets loaded by the tmux it is for. `bin/check` also loads every platform-specific file directly, so the macOS files get checked on Linux too. The workflow also runs `bin/check` on macOS with the Homebrew tmux.

A weekly workflow, `.github/workflows/tmux-release.yml`, runs `bin/check-tmux-release`, which fails when tmux has a release that is newer than our newest version directory. To add a version directory, see [CONTRIBUTING.md](CONTRIBUTING.md).

`bin/lint` finds mistakes that tmux would report when it reads a file, such as a misspelled option or a value that a version doesn't support. It doesn't run the commands, so it can't find mistakes in what the settings do, such as a key binding that doesn't do what you want.


## Primer

A good tmux primer:

* https://github.com/tmux/tmux/wiki/Getting-Started

* https://web.archive.org/web/2016/http://tangosource.com/blog/a-tmux-crash-course-tips-and-tweaks/ (archived)


## Notation

Keys:

* C-x means press the control key and x key

* M-x means press the alt key and x key

What is a session, a window, a pane?

* A session is a set of windows.

* A window is a single screen covered with panes.

* A pane is a part of a window that runs a specific command, e.g. a shell.


## Use SSH to help with window naming

If you want to use SSH and have each new SSH window cause its own window naming,
then add this to your tmux config file:

```tmux
set-option -g allow-rename on
```

And add code like this to your SSH config file, typically `~/.ssh/config`:

```ssh
Host *
PermitLocalCommand yes
LocalCommand if [[ $TERM == screen* || $TERM == tmux* ]]; then printf "\033k%h\033\\"; fi
```

When we sign in to a server, the code runs a command to print the server's
local hostname with an escape sequence that triggers tmux to set the window name.
If we open the list of windows (ctrl-a w) we see each window's server name.
This is also the reason why I have automatic window renaming turned off.

Note: The allow-rename option was added in tmux 1.6 and with default on. The allow-rename default changed after tmux 2.7 from on to off. If allow-rename is off, then the SSH code to rename each window will not have any effect.

The `$TERM` check matches both `screen*` and `tmux*`, because our `shell.conf` sets the terminal type to `tmux-256color`.

Credits:

  * http://www.unwiredcouch.com/2013/11/15/my-tmux-setup.html

  * https://www.reddit.com/user/moobarmoobar/


## See also

* https://github.com/tmux/tmux/wiki

* https://wiki.archlinux.org/title/Tmux

* https://web.archive.org/web/2016/http://blog.hawkhost.com/2010/07/02/tmux-%E2%80%93-the-terminal-multiplexer-part-2/ (archived)


## Thanks

Thanks to many people on the net for providing tmux conf files,
and blogging about how to set tmux and its related tools.

* https://gist.github.com/andreyvit/2921703
* https://github.com/terryma/dotfiles/blob/master/.tmux.conf
* mindfuzz.net (no longer online)
* https://web.archive.org/web/2016/http://tangledhelix.com/blog/2012/07/16/tmux-and-mouse-mode/ (archived)
* http://www.unwiredcouch.com/2013/11/15/my-tmux-setup.html
* https://stackoverflow.com/questions/35016458
* https://stackoverflow.com/users/5353461/tom-hale
* https://github.com/HaleTom


## Key bindings

### Our key bindings

These are the keys that our example `tmux.conf` changes. Prefix keys are pressed after the prefix key, which our `prefix-is-control-a.conf` sets to C-a.

| Key | What it does | File | Replaces the tmux default |
|---|---|---|---|
| C-a | The prefix key | `prefix-is-control-a.conf` | C-b |
| prefix C-a | Send C-a to the program in the pane | `prefix-is-control-a.conf` | |
| prefix \| | Split left and right, in the current directory | `split-window.conf` | |
| prefix _ | Split top and bottom, in the current directory | `split-window.conf` | |
| prefix c | New window, in the current directory | `split-window.conf` | New window, in the session directory |
| prefix h j k l | Select the pane left, down, up, right | `select-pane-via-hjkl.conf` | prefix l: last window |
| prefix H J K L | Resize the pane by 5 cells; repeatable | `resize-pane-via-hjkl.conf` | prefix L: last session |
| prefix S | Switch session by name | `switch-session-via-name.conf` | |
| prefix + | Zoom the pane to fill the window | `zoom-via-plus-minus.conf` | |
| prefix - | Unzoom the pane | `zoom-via-plus-minus.conf` | Delete the newest paste buffer |
| prefix ; | Command prompt | `shell.conf` | Last pane |
| prefix r | Reload the config | `reload-via-r.conf` | Redraw the client |
| prefix T | Scratch shell popup; tmux 3.2 and newer | `popup.conf` | 3.8: change the pane title |
| prefix g | lazygit popup, if lazygit is installed; tmux 3.2 and newer | `popup.conf` | |
| v, C-v, y | In copy mode: begin selection, rectangle selection, copy | `copy-mode-via-vi-keys.conf` | |

On macOS, the platform-specific files change these keys too:

| Key | What it does | File | Replaces the tmux default |
|---|---|---|---|
| prefix y | Copy the newest tmux buffer to the clipboard | `platform-specific/darwin/tmux.conf` | |
| prefix p | Paste from the clipboard | `platform-specific/darwin/paste-via-pbpaste.conf` | Previous window |
| y, Enter, mouse drag | In copy mode: copy to the clipboard | `platform-specific/darwin/copy-mode-via-pbcopy.conf` | |

These optional files are not in our example `tmux.conf`, because they replace keys that many people use:

| Key | What it does | File | Replaces the tmux default |
|---|---|---|---|
| M-1 to M-9, M-0 | Select window 1 to 9, or 10; no prefix | `select-window-via-meta-number.conf` | Meta digits in programs, such as editors |
| prefix [ | Even horizontal layout | `select-layout-via-brackets.conf` | Copy mode |
| prefix ] | Even vertical layout | `select-layout-via-brackets.conf` | Paste the newest buffer |

In tmux 3.8, prefix Tab opens a fast window switcher, and prefix S-Tab opens a fast session switcher.

### tmux default key bindings

These are the tmux default prefix keys. A key marked *changed* has a different binding in our example `tmux.conf`; see above.

```txt
C-b         Send the prefix key through to the application. (changed: C-a)
C-o         Rotate the panes in the current window forwards.
C-z         Suspend the tmux client.
!           Break the current pane out of the window.
"           Split the current pane into two, top and bottom.
#           List all paste buffers.
$           Rename the current session.
%           Split the current pane into two, left and right.
&           Kill the current window.
'           Prompt for a window index to select.
,           Rename the current window.
-           Delete the most recently copied buffer of text. (changed)
.           Prompt for an index to move the current window.
0 to 9      Select windows 0 to 9.
:           Enter the tmux command prompt.
;           Move to the previously active pane. (changed)
=           Choose which buffer to paste interactively from a list.
?           List all key bindings.
D           Choose a client to detach.
L           Switch the attached client back to the last session. (changed)
T           Change the pane title; tmux 3.8 and newer. (changed)
[           Enter copy mode to copy text or view the history.
]           Paste the most recently copied buffer of text.
c           Create a new window. (changed: in the current directory)
d           Detach the current client.
f           Prompt to search for text in open windows.
i           Display some information about the current window.
l           Move to the previously selected window. (changed)
n           Change to the next window.
o           Select the next pane in the current window.
p           Change to the previous window. (changed on macOS)
q           Briefly display pane indexes.
r           Force redraw of the attached client. (changed)
s           Select a new session for the attached client interactively.
t           Show the time.
w           Choose the current window interactively.
x           Kill the current pane.
z           Toggle the zoom of the current pane.
{           Swap the current pane with the previous pane.
}           Swap the current pane with the next pane.
~           Show previous messages from tmux, if any.
Tab         Open the window switcher; tmux 3.8 and newer.
S-Tab       Open the session switcher; tmux 3.8 and newer.
Page Up     Enter copy mode and scroll one page up.
↑ ↓ ← →     Change to the pane up, down, left, right of the current pane.
M-1 to M-5  Arrange panes in one of the five preset layouts: even-
              horizontal, even-vertical, main-horizontal, main-
              vertical, or tiled.
M-n         Move to the next window with a bell or activity marker.
M-o         Rotate the panes in the current window backwards.
M-p         Move to the previous window with a bell or activity
              marker.
C-↑ C-↓
C-←, C-→
            Resize the current pane in steps of one cell.
M-↑, M-↓
M-←, M-→
            Resize the current pane in steps of five cells.
```


## Tracking

* Package: sixarm.com/tmux-conf
* Version: 6.0.0
* Created: 2014-11-29
* Updated: 2026-11-07
* Contact: Joel Parker Henderson (joel@joelparkerhenderson.com)
* License: `MIT OR Apache-2.0 OR GPL-2.0-only OR GPL-3.0-only OR BSD-3-Clause`, or contact us for other terms (see [LICENSE.md](LICENSE.md))
