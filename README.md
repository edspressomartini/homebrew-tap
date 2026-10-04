# Up Next — Homebrew tap

A macOS menu-bar widget showing today's calendar and a TODO list.
Source and documentation: [upnextapp.co.uk](https://upnextapp.co.uk/) ·
[edspressomartini/calendar](https://github.com/edspressomartini/calendar)

```sh
brew tap edspressomartini/tap
brew trust edspressomartini/tap
brew install --cask up-next
```

The `brew trust` line is not optional. Since Homebrew 6, casks from a
third-party tap are refused outright until you say you trust the tap, which is
Homebrew asking you to make the same judgement this README is about. On a
managed Mac you may not be able to grant it at all.

## Signing

From `0.2.0`, Up Next is signed with an Apple Developer ID and notarised by
Apple, so macOS opens it normally. Earlier versions were not, and required a
trip to System Settings on every install; upgrading is the fix.

Check it yourself rather than taking the word of a README:

```sh
spctl --assess --type execute --verbose=4 "/Applications/Up Next.app"
# accepted
# source=Notarized Developer ID
```

Notarisation means Apple scanned the binary for known malicious code and can
revoke the identity behind it. It does not mean Apple reviewed what the app
does. The [security page](https://upnextapp.co.uk/security.html) describes
what it reaches, what it stores, and what none of this protects against.

## Requirements

Apple silicon, macOS Ventura or newer. There is no Intel build.

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
