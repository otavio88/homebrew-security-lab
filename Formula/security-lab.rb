
class SecurityLab < Formula
  desc "Homebrew WSL Kubernetes security validation lab"
  homepage "https://github.com/otavio88/homebrew-security-lab"
  url "https://github.com/otavio88/homebrew-security-lab/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "REPLACE_WITH_REAL_SHA256"
  license "MIT"

  def install
    bin.install "scripts/security-lab.sh" => "security-lab"
  end

  test do
    assert_predicate bin/"security-lab", :executable?
  end
end
