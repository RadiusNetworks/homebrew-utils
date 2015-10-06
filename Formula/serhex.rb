require 'formula'

class Serhex < Formula
  homepage 'https://github.com/RadiusNetworks/serhex'
  head 'git@github.com:RadiusNetworks/serhex.git'
  url 'https://github.com/RadiusNetworks/serhex/archive/v0.1.tar.gz'
  md5 '15768dc46244384c2cb3bfcd46c7e0c5'
  version '0.1'

  def install
    system "prefix=\"#{prefix}\" make install"
  end

end
