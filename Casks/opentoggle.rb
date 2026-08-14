cask "opentoggle" do
  version "0.5.0"
  sha256 "1bd6202e2dc17f1efcaf4487512ee1a91c7e1fa619ff977774579e3dd50defce"

  url "https://github.com/HanlunWang/open-toggle/releases/download/v#{version}/OpenToggle-#{version}.zip"
  name "OpenToggle"
  desc "Script-powered menu bar switches with managed lifecycle"
  homepage "https://github.com/HanlunWang/open-toggle"

  depends_on macos: ">= :sonoma"

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
