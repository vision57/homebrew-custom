
class Sshpass < Formula
  desc "Sshpass is a tool for non-interactivly performing password authentication with SSH's so called \"interactive keyboard password authentication\".Most user should use SSH's more secure public key authentiaction instead."
  homepage "https://sourceforge.net/projects/sshpass/"
  url "https://jaist.dl.sourceforge.net/project/sshpass/sshpass/1.06/sshpass-1.06.tar.gz"
  sha256 "c6324fcee608b99a58f9870157dfa754837f8c48be3df0f5e2f3accf145dee60"

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel

    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"

    system "make", "install"
  end

  test do
    assert_match "1.06", shell_output("#{bin}/sshpass -V")
  end
end
