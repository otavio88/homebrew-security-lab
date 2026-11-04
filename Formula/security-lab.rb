class SecurityLab < Formula
  desc "Homebrew WSL Kubernetes security validation lab"
  homepage "https://github.com/otavio88/homebrew-security-lab"

  url "https://github.com/otavio88/homebrew-security-lab.git",
      using: :git,
      tag: "v1.0.0"

  version "1.0.0"

  def install
    bin.install "scripts/security-lab.sh" => "security-lab"
  end

  test do
    assert_predicate bin/"security-lab", :executable?
  end
end