# frozen_string_literal: true

class Gaia < Formula
  include Language::Python::Virtualenv

  desc "Goal-oriented Autonomous Intelligence for Adaptive GUI Testing"
  homepage "https://github.com/capston2025/capston"
  url "https://github.com/capston2025/capston/archive/refs/heads/main.tar.gz"
  version "0.1.0"
  sha256 "23df20737d102e5353a77857106d20529dbcd05c0ec767affbd601e15c67953a"

  license "MIT"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, Formula["python@3.12"].opt_bin/"python3.12")
    venv.pip_install Pathname.pwd
    venv.pip_install_and_link
  end



  test do
    assert_match "usage", shell_output("#{bin}/gaia --help")
  end
end
