# Clashboard

Read-only static viewer for Codex and Claude Code JSONL session logs.

## Use

Host `index.html` as a static website. Open the page, choose a default history
folder:

```sh
~/.codex/sessions
~/.claude/projects
```

or select specific `.jsonl` files with `Open files`.

On macOS, the `.codex` and `.claude` folders are hidden in Finder. Press
`Command Shift .` to toggle hidden files and folders, or press `Command Shift G`
and enter `~/.codex` or `~/.claude` to jump there directly.

The page shows the default Codex and Claude Code history paths at the top of the
picker controls. Use `Copy path` if you want to paste one into Finder's
`Command Shift G` dialog, then grant access with `Open selected folder` or
`Open folder`.

The app parses and filters logs entirely in the browser. Browsers do not allow a
hosted static site to silently read local files, so the folder or files must be
selected by the user.

## Browser Notes

- `Open files` works with standard file selection.
- `Open folder` works best in Chromium-based browsers over HTTPS or localhost.
- If hosting from S3, put CloudFront with HTTPS in front of the bucket for the
  best folder-picker behavior.
