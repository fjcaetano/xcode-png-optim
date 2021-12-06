class XcodePngOptim < Formula
  version "0.1.0"
  desc "Scans an Xcode target for PNGs and converts all to optimized JPEGs"
  homepage "https://github.com/fjcaetano/xcode-png-optim"
  url "https://codeload.github.com/fjcaetano/xcode-png-optim/tar.gz/#{version}"
  sha256 "e726aeb57c275ad8cd137b3ec057768ecbdfb7810fa595138bd56e6e972a1804"

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
