require "formula"

class Serhex < Formula
  homepage "https://github.com/RadiusNetworks/serhex"
  head "git@github.com:RadiusNetworks/serhex.git"
  url "https://github.com/RadiusNetworks/serhex/archive/v0.1.2.tar.gz"

  # To create the sha256:
  # curl -L "https://github.com/RadiusNetworks/serhex/archive/v0.1.2.tar.gz" | shasum -a 256
  sha256 "b4416983cff94f1cdad196803020e30b8879ff54b4bf67d18818647adf61a70b"
  version "0.1.2"

  def install
    system "prefix=\"#{prefix}\" make install"
  end

end
