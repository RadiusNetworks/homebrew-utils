require 'formula'

class Serhex < Formula
  homepage 'https://github.com/RadiusNetworks/serhex'
  head 'git@github.com:RadiusNetworks/serhex.git'
  url 'https://github.com/RadiusNetworks/serhex/archive/v0.1.tar.gz'
  sha256 '2e8d3f4c36977bd671094bbd1d73d29646d583cc98cb7d57c0f0021e48e6a583'
  version '0.1'

  def install
    system "prefix=\"#{prefix}\" make install"
  end

end
