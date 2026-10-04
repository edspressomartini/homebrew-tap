cask "up-next" do
  version "0.2.0"
  sha256 "b9ac787093ebead3f968fe04337a800f1f51926773bbe1ffe86f703283e86de7"

  url "https://github.com/edspressomartini/calendar/releases/download/v#{version}/up-next-#{version}-arm64.dmg"
  name "Up Next"
  desc "Menu-bar widget showing today's calendar and a TODO list"
  homepage "https://upnextapp.co.uk/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura
  depends_on arch: :arm64

  app "Up Next.app"

  # No caveats from 0.2.0 onwards. The build is signed with a Developer ID and
  # notarised, so macOS opens it normally and there is nothing to warn about.

  zap trash: [
    "~/Library/Application Support/Up Next",
    "~/Library/Logs/Up Next",
    "~/Library/Preferences/com.upnext.app.plist",
    "~/Library/Saved Application State/com.upnext.app.savedState",
  ]
end
