class GravedecayCompanion < Formula
  desc "User-scoped macOS Gravedecay companion"
  homepage "https://github.com/projectmushroom/gravedecay"
  url "https://github.com/projectmushroom/gravedecay/archive/refs/tags/v0.26.1.tar.gz"
  sha256 "15a076f6346e3de223054f4fb030b454d2d997af51b01a25ddf3c4c59a68d752"
  license "MIT"

  depends_on :macos
  depends_on "python"
  depends_on "node" => :optional
  depends_on "tmux" => :optional
  depends_on "ttyd" => :optional

  def install
    libexec.install "macos/gravedecay-mac", "macos/install.sh", "macos/status.sh", "macos/uninstall.sh"
    (bin/"gravedecay-mac").write_env_script libexec/"gravedecay-mac",
                         GRAVEDECAY_MAC_BREW_TAG: "v0.26.1"
  end

  def caveats
    <<~EOS
      Run `gravedecay-mac install` after signing into Tailscale.
      For T3 and the web terminal: `brew install gravedecay-companion --with-node --with-tmux --with-ttyd`
      then run `gravedecay-mac install --agents`.

      Gravedecay owns its user LaunchAgents itself; do not use `brew services`.
    EOS
  end

  test do
    assert_match "usage: gravedecay-mac", shell_output("#{bin}/gravedecay-mac 2>&1", 2)
  end
end
