# Contributing

To contribute code, you can create a pull request, or send us email, or chat with us, whichever is easiest for you.

To contribute money, you can use PayPal to send money to sixarm@sixarm.com, or email us to ask about other ways.

## Add a version directory for a new tmux release

When tmux has a new release, such as 3.9, our weekly `tmux-release` workflow fails, and `bin/check-tmux-release` says so. To add the version directory:

1. Copy the newest version directory, such as `cp -R sources/3.8 sources/3.9`.

2. Edit the first line of the new `tmux.conf`, such as "Example tmux.conf that sources our files, for tmux 3.9."

3. Read the tmux `CHANGES` file for the new release. For each new option, add a file. For each changed or removed option, edit the files that use it, in the new directory only.

4. Run `bin/lint 3.9`, which reads the tmux 3.9 source code, and fix any problems.

5. If you have tmux 3.9 installed, then run `bin/check`.

6. Add `"3.9"` to the `tmux` matrix in `.github/workflows/test.yml`.

7. Update the version range, such as "1.9 through 3.9", in `README.md` and `CITATION.cff`.
