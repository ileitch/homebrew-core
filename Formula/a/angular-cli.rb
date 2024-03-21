require "language/node"

class AngularCli < Formula
  desc "CLI tool for Angular"
  homepage "https://cli.angular.io/"
  url "https://registry.npmjs.org/@angular/cli/-/cli-17.3.1.tgz"
  sha256 "aec4b7753820d0ca632d2f3c2b62867ff76e3e491dd5f4429ac632fe0f541595"
  license "MIT"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_sonoma:   "d5fad58040eb261f3e88453476752bdf667725c80c78f421a69649a53561cc03"
    sha256 cellar: :any_skip_relocation, arm64_ventura:  "d5fad58040eb261f3e88453476752bdf667725c80c78f421a69649a53561cc03"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "d5fad58040eb261f3e88453476752bdf667725c80c78f421a69649a53561cc03"
    sha256 cellar: :any_skip_relocation, sonoma:         "f386f3e179221a6d72b3b12fd9b9e2408e2cff872b99aa566fcdda83042da201"
    sha256 cellar: :any_skip_relocation, ventura:        "f386f3e179221a6d72b3b12fd9b9e2408e2cff872b99aa566fcdda83042da201"
    sha256 cellar: :any_skip_relocation, monterey:       "f386f3e179221a6d72b3b12fd9b9e2408e2cff872b99aa566fcdda83042da201"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "d5fad58040eb261f3e88453476752bdf667725c80c78f421a69649a53561cc03"
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system bin/"ng", "new", "angular-homebrew-test", "--skip-install"
    assert_predicate testpath/"angular-homebrew-test/package.json", :exist?, "Project was not created"
  end
end
