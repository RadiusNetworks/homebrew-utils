require "formula"

class Rbcom < Formula
  homepage 'https://github.com/RadiusNetworks/rbcom'
  head 'git@github.com:RadiusNetworks/ble112-usb-comm.git'
  url 'https://s3.amazonaws.com/downloads.radiusnetworks.com/13359be6-c7cd-4a61-829f-44196e980ae8/rbcom-1.3.3.tar.gz'

  # To create the sha256:
  # curl -L "https://github.com/PATH" | shasum -a 256
  sha256 "12fd23723095797fdb3123a8ca130de050e9e710196b6d60be5456abfe8e97c7"
  version "1.3.3"

  def install
    bin.install "rbcom"
  end

end
