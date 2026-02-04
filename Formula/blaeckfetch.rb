class Blaeckfetch < Formula
  desc "Fast system fetch display for your terminal"
  homepage "https://github.com/gustafeden/blaeckfetch"
  version "0.4.0"
  license "MIT"

  if Hardware::CPU.intel?
    url "https://github.com/gustafeden/blaeckfetch/releases/download/v0.4.0/blaeckfetch-x86_64-apple-darwin.tar.gz"
    sha256 "1269afc25ed9f0d1d26a9122c336e1f2f8249f204e5846eafe706833062c1e03"
  else
    url "https://github.com/gustafeden/blaeckfetch/releases/download/v0.4.0/blaeckfetch-aarch64-apple-darwin.tar.gz"
    sha256 "e167c34985f7bcd57ec96ef3dc6441e4c1875ecc7bb15fb1e75740d2410a1cff"
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

      Docs: https://gustafeden.github.io/blaeckfetch/
    EOS
  end

  test do
    assert_match "blaeckfetch", shell_output("#{bin}/blaeckfetch --version")
  end
end
