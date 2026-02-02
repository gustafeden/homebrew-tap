class Rsfetch < Formula
  desc "Fast system fetch display for your terminal"
  homepage "https://github.com/gustafeden/rsfetch"
  version "0.3.0"
  license "MIT"

  if Hardware::CPU.intel?
    url "https://github.com/gustafeden/rsfetch/releases/download/v0.3.0/rsfetch-x86_64-apple-darwin.tar.gz"
    sha256 "7d3e81cf92f1043171c232c13f1e6aa6dfcedfbd705cb182ab935f489166c038"
  else
    url "https://github.com/gustafeden/rsfetch/releases/download/v0.3.0/rsfetch-aarch64-apple-darwin.tar.gz"
    sha256 "826191e6a393a4e44d6e7895d332c7588e7a7a359c4245fe9dc644383ba5928c"
  end

  def install
    bin.install "rsfetch"
  end

  def caveats
    <<~EOS
      Get started:
        rsfetch                    # Standard system info
        rsfetch --boot             # Retro console-style boot animation
        rsfetch --boot --center    # Centered boot animation

      Add to your shell (~/.zshrc or ~/.bashrc):
        rsfetch --boot

      Configuration:
        rsfetch --print-config > ~/.config/rsfetch/config.toml

      Docs: https://github.com/gustafeden/rsfetch
    EOS
  end

  test do
    assert_match "rsfetch", shell_output("#{bin}/rsfetch --version")
  end
end
