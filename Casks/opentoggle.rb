cask "opentoggle" do
  version "0.5.1"
  sha256 "fa9a821be6100da4cf00ecd274af9851cfb3cc23f764f0f9bd6d8ad135e4e37d"

  url "https://github.com/HanlunWang/open-toggle/releases/download/v#{version}/OpenToggle-#{version}.zip"
  name "OpenToggle"
  desc "Script-powered menu bar switches with managed lifecycle"
  homepage "https://github.com/HanlunWang/open-toggle"

  depends_on macos: :sonoma

  app "OpenToggle.app"
  # CLI：opentoggle 命令直接可用（同一二进制）
  binary "#{appdir}/OpenToggle.app/Contents/MacOS/OpenToggle", target: "opentoggle"

  zap trash: [
    "~/.config/open-toggle",
  ]

  caveats <<~EOS
    Switch scripts live in ~/.config/open-toggle/switches/
    Key-sending switches need a one-time Accessibility grant
    (System Settings → Privacy & Security → Accessibility).
  EOS
end
