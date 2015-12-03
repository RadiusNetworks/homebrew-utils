require "formula"

class RadbeaconFlasher < Formula
  homepage "https://github.com/RadiusNetworks/radbeacon-flasher"
  head "git@github.com:RadiusNetworks/radbeacon-flasher.git"
  url "https://github.com/RadiusNetworks/radbeacon-flasher/archive/v0.2.0.tar.gz"

  # To create the sha256:
  # curl -L "https://github.com/PATH" | shasum -a 256
  sha256 "4183646ed24f537d4032b17ff84f51c255d8435679eec7fcd12d3354aaa9553a"
  version "0.2.0"

  depends_on "dfu-util"
  depends_on "serhex"

  def install
    bin.install "radbeacon-flasher"
  end

end
