require "formula"

class RadbeaconFlasher < Formula
  homepage "https://github.com/RadiusNetworks/radbeacon-flasher"
  head "git@github.com:RadiusNetworks/radbeacon-flasher.git"
  url "https://github.com/RadiusNetworks/radbeacon-flasher/archive/v0.1.0.tar.gz"

  # To create the sha256:
  # curl -L "https://github.com/PATH" | shasum -a 256
  sha256 "f6eba1625aad142781572cf0ccd8361b962c0320550e1616082dd9e8972f15c4"
  version "0.1.0"

  depends_on "dfu-util"
  depends_on "serhex"

  def install
    bin.install "radbeacon-flasher"
  end

end
