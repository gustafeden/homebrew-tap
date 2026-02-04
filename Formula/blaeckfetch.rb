class Blaeckfetch < Formula
  desc "Fast system fetch display for your terminal"
  homepage "https://github.com/gustafeden/blaeckfetch"
  version "0.3.0"
  license "MIT"

  if Hardware::CPU.intel?
    url "https://github.com/gustafeden/blaeckfetch/releases/download/v0.3.0/blaeckfetch-x86_64-apple-darwin.tar.gz"
    sha256 "7d3e81cf92f1043171c232c13f1e6aa6dfcedfbd705cb182ab935f489166c038"
  else
    url "https://github.com/gustafeden/blaeckfetch/releases/download/v0.3.0/blaeckfetch-aarch64-apple-darwin.tar.gz"
    sha256 "826191e6a393a4e44d6e7895d332c7588e7a7a359c4245fe9dc644383ba5928c"
  end

  def install
    bin.install "blaeckfetch"
  end

  def caveats
    <<~EOS
      Get started:
        blaeckfetch                    # Standard system info
        blaeckfetch --splash           # Retro console-style splash animation
        blaeckfetch --splash --center  # Centered splash animation

      Add to your shell (~/.zshrc or ~/.bashrc):
        blaeckfetch --splash

      Configuration:
        blaeckfetch --print-config > ~/.config/blaeckfetch/config.toml

      Docs: https://github.com/gustafeden/blaeckfetch
    EOS
  end

  test do
    assert_match "blaeckfetch", shell_output("#{bin}/blaeckfetch --version")
  end
end
