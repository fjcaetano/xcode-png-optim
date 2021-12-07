class XcodePngOptim < Formula
  version "0.2.0"
  desc "Scans an Xcode target for PNGs and converts all to optimized JPEGs"
  homepage "https://github.com/fjcaetano/xcode-png-optim"
  url "https://codeload.github.com/fjcaetano/xcode-png-optim/tar.gz/#{version}"
  sha256 "d67e2a654dd2cb654864a5ce31baf18c397c97fe35a8aaaf63a908b0f6ef3b06"

  depends_on "imagemagick"
  depends_on "jpegoptim"

  def install
    inreplace "bin/xcode-png-optim" do |s|
      s.gsub! /PKG_VERSION=.*/, "PKG_VERSION='#{version}'"
    end

    bin.install "bin/xcode-png-optim"
  end

  test do
    system "which", "xcode-png-optim"
  end
end
