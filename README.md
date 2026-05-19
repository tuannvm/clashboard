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

## Local Web Server

For macOS users, the quickest no-clone local server is:

```sh
curl -fsSL -H 'Accept: application/vnd.github.raw' https://api.github.com/repos/tuannvm/clashboard/contents/serve.py | python3
```

Stop the server with `Control C` in the terminal. If port `8767` is already
busy, the helper automatically uses the next open local port.

On macOS, the `.codex` and `.claude` folders are hidden in Finder. Press
`Command Shift .` to toggle hidden files and folders, or press `Command Shift G`
and enter `~/.codex` or `~/.claude` to jump there directly.

The app parses and filters logs entirely in the browser. Browsers do not allow a
hosted static site to silently read local files, so the folder or files must be
selected by the user.

Sessions are sorted newest-first, and each session also shows the newest visible
message at the top. Static hosting does not provide realtime disk updates from
`~/.codex` or `~/.claude`; reselect the folder or files when you want to
refresh from updated logs.

Visible user and assistant messages render common Markdown directly in the
browser, including headings, lists, blockquotes, links, tables, inline code, and
fenced code blocks. Tool calls and tool outputs remain collapsed and plain-text
for easier inspection.

## Browser Notes

- `Open files` works with standard file selection.
- `Open folder` works best in Chromium-based browsers over HTTPS or localhost.
- If hosting from S3, put CloudFront with HTTPS in front of the bucket for the
  best folder-picker behavior.
