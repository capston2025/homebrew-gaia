# frozen_string_literal: true

class Gaia < Formula

  desc "Goal-oriented Autonomous Intelligence for Adaptive GUI Testing"
  homepage "https://github.com/capston2025/capston"
  url "https://github.com/capston2025/capston/archive/refs/heads/main.tar.gz"
  version "0.1.0"
  sha256 "34df00308211c9772bac7ab7869ed702829d63f0eff932e26166a6a90931e7c9"

  license "MIT"

  depends_on "python@3.12"

  include Language::Python::Virtualenv
  
  def install
    python = Formula["python@3.12"].opt_bin/"python3.12"
    system python, "-m", "venv", "--system-site-packages", libexec

    system libexec/"bin/python", "-m", "pip", "install", "--upgrade", "pip"
    system libexec/"bin/python", "-m", "pip", "install", "--verbose", "--no-cache-dir", Pathname.pwd
    bin.install_symlink libexec/"bin/gaia"
  end



  test do
    assert_match "usage", shell_output("#{bin}/gaia --help")
  end
end
