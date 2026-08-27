class GravedecayCompanion < Formula
  desc "User-scoped macOS Gravedecay companion"
  homepage "https://github.com/projectmushroom/gravedecay"
  url "https://github.com/projectmushroom/gravedecay/archive/refs/tags/v0.22.0.tar.gz"
  sha256 "299f41335ee00c9e559c7d8137145d902f867e4b17ed0adab52fd5d5214ff64e"
  license "MIT"

  depends_on :macos
  depends_on "python"
  depends_on "node" => :optional
  depends_on "tmux" => :optional
  depends_on "ttyd" => :optional

  def install
    libexec.install "macos/gravedecay-mac", "macos/install.sh", "macos/status.sh", "macos/uninstall.sh"
    (bin/"gravedecay-mac").write_env_script libexec/"gravedecay-mac",
                         GRAVEDECAY_MAC_BREW_TAG: "v0.22.0"
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
