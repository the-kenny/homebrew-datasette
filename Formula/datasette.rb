class Datasette < Formula
  include Language::Python::Virtualenv

  desc "A tool for exploring and publishing data"
  homepage "http://datasette.readthedocs.io/"
  url "https://github.com/simonw/datasette/archive/0.39.tar.gz"
  sha256 "fb1eb6a6912f10a54e80c738e11f133ed581366bb74805e533eaae8924f58fdc"

  depends_on "python@3.8"

  def install
    venv = virtualenv_create(libexec, "python3")
    system libexec/"bin/pip", "install", "-v", "--no-binary", ":all:",
                              "--ignore-installed", buildpath
    system libexec/"bin/pip", "uninstall", "-y", "datasette"
    venv.pip_install_and_link buildpath
  end

  test do
    system "datasette", "--help"
  end
end
