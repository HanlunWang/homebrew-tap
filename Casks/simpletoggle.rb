cask "simpletoggle" do
  version "2.0.2"
  sha256 "2cc41861cd557d47c5952c25a347221fe05e7ad74ba8d64ffe010c637cfb144c"

  url "https://github.com/HanlunWang/simple-toggle/releases/download/v#{version}/SimpleToggle.#{version}.dmg"
  name "SimpleToggle"
  desc "Turn scripts into managed menu bar switches"
  homepage "https://github.com/HanlunWang/simple-toggle"

  # app 会自己检查并安装更新（签名校验）；brew upgrade 不必替它升级
  auto_updates true
  depends_on macos: :sonoma

  app "SimpleToggle.app"
  # CLI：simpletoggle 命令就是 app 自己的二进制
  binary "#{appdir}/SimpleToggle.app/Contents/MacOS/SimpleToggle", target: "simpletoggle"

  zap trash: [
    "~/.config/simple-toggle",
    "~/Library/Application Support/SimpleToggle",
    "~/Library/Preferences/io.github.hanlunwang.SimpleToggle.plist",
  ]

  caveats <<~EOS
    Switch scripts live in ~/.config/simple-toggle/switches/
  EOS
end
