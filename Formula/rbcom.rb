require 'formula'

class Rbcom < Formula
  homepage 'https://github.com/RadiusNetworks/ble112-usb-comm'
  head 'git@github.com:RadiusNetworks/ble112-usb-comm.git'
  url 'https://github.com/RadiusNetworks/ble112-usb-comm/archive/v0.1.1.tar.gz'
  md5 'ac85288180817f3eb9b532783286e740'
  version '0.1.1'

  def install
    system "prefix=\"#{prefix}\" make install"
  end

end
