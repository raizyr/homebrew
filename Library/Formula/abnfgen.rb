class Abnfgen < Formula
  desc "Quickly generate random documents that match an ABFN grammar"
  homepage "http://www.quut.com/abnfgen/"
  url "http://www.quut.com/abnfgen/abnfgen-0.17.tar.gz"
  sha256 "777a264d91a93bc9cf008d7520abb0470d7280fb38008c5f185cbf2d29640083"

  bottle do
    cellar :any_skip_relocation
    sha256 "270beb4ef879e95db6fb923779cc33952bc669df60a1ecb35060c987ec5a5b06" => :el_capitan
    sha256 "abf32ccd9622fbcde577f80b7202ff2c75cb59475db560861dfd59bcdd867ed4" => :yosemite
    sha256 "d056030b0bdd266ab43fdbe91bd898af763f5be1a04170cd8db900134c50c7da" => :mavericks
  end

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--mandir=#{man}"
    system "make", "install"
  end

  test do
    (testpath/"grammar").write %(ring = 1*12("ding" SP) "dong" CRLF)
    system "#{bin}/abnfgen", (testpath/"grammar")
  end
end
