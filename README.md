# Up Next — Homebrew tap

A macOS menu-bar widget showing today's calendar and a TODO list.
Source and documentation: [upnextapp.co.uk](https://upnextapp.co.uk/) ·
[edspressomartini/calendar](https://github.com/edspressomartini/calendar)

```sh
brew tap edspressomartini/tap
brew install --cask up-next
```

## macOS will refuse to open it the first time

This is expected, and it is not a sign that anything is wrong with the
download. Up Next is not notarised by Apple, because the project has no Apple
Developer Program membership. macOS blocks anything it has not seen notarised,
and gives you no button in the dialog to continue.

To allow it:

1. Try to open Up Next. macOS blocks it.
2. Open **System Settings → Privacy & Security**.
3. Scroll down and click **Open Anyway** next to Up Next.

You will have to do this again after each `brew upgrade`, because the replaced
app is assessed afresh.

What this costs you is Apple's malware scan of the binary and a revocable
developer identity. It is a real thing to give up, and you should weigh it
before installing. What it does not cost is the app's own hardening: the build
is signed, the hardened runtime is on, and the
[security page](https://upnextapp.co.uk/security.html) describes exactly what
that does and does not cover.

## Requirements

Apple silicon, macOS Sonoma or newer. There is no Intel build.

## Updates

```sh
brew upgrade --cask up-next
```

There is no auto-updater in the app and nothing phones home; Homebrew is the
only update channel. Each cask release pins the SHA-256 of its DMG, so a
download that does not match is refused rather than installed.

Upgrades keep your data. Settings, the TODO list and the stored Google tokens
live in `~/Library/Application Support/Up Next` and survive. Only
`brew uninstall --zap --cask up-next` removes them.

Quit the app before upgrading. Homebrew will replace the bundle underneath a
running copy, but that copy keeps the old code until it restarts.
