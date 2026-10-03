cask "up-next" do
  version "0.1.0"
  sha256 "1dcde86efe3929e56f6d2601370c2bb4227461ce89ed2287e2d8ea2b763acf70"

  url "https://github.com/edspressomartini/calendar/releases/download/v#{version}/up-next-#{version}-arm64.dmg"
  name "Up Next"
  desc "Menu-bar widget showing today's calendar and a TODO list"
  homepage "https://upnextapp.co.uk/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"
  depends_on arch: :arm64

  app "Up Next.app"

  # Without this the install looks like it worked and the app will not open,
  # with nothing on screen explaining why.
  caveats <<~EOS
    Up Next is not notarised by Apple, so macOS will refuse to open it the
    first time, and again after each upgrade.

    To allow it:
      1. Try to open Up Next. macOS will block it.
      2. Open System Settings > Privacy & Security.
      3. Scroll down and click "Open Anyway" next to Up Next.

    This is because the project has no Apple Developer Program membership.
    See https://upnextapp.co.uk/security.html
  EOS

  zap trash: [
    "~/Library/Application Support/Up Next",
    "~/Library/Logs/Up Next",
    "~/Library/Preferences/com.upnext.app.plist",
    "~/Library/Saved Application State/com.upnext.app.savedState",
  ]
end
