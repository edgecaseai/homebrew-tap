# The chessdrive CLI, written by `make cli-release` from devplatform/cli/homebrew/chessdrive.rb.tmpl in
# cem-unuvar/chesslm (W2-19): edit the template there, not this file. Each URL is a binary that release uploaded,
# checked by the SHA-256 in its SHA256SUMS.
class Chessdrive < Formula
  desc "Call the ChessDrive API's Generate, Embed, Search and Engine from a terminal"
  homepage "https://platform.chessdrive.io/docs/cli"
  version "0.7.0"

  on_macos do
    on_arm do
      url "https://api.chessdrive.io/cli/0.7.0/chessdrive_darwin_arm64"
      sha256 "3d075fb3041a3bc19e44056c216527d501267b86fe38c5e6bef00e8eec09d0ed"
    end
    on_intel do
      url "https://api.chessdrive.io/cli/0.7.0/chessdrive_darwin_amd64"
      sha256 "bae38b9625b1fd1c89f5be01ecb8c93dd5d0d58118c87f13e18d6a5eac11d219"
    end
  end

  on_linux do
    on_arm do
      url "https://api.chessdrive.io/cli/0.7.0/chessdrive_linux_arm64"
      sha256 "bdf3256f67d1bd843d85a0e9e1590d39975282683a5648390277112b87fa2442"
    end
    on_intel do
      url "https://api.chessdrive.io/cli/0.7.0/chessdrive_linux_amd64"
      sha256 "42dec9c31a254fd4cb772cfdec1dcb260f9b08b5cb22aead6b5165059b09974f"
    end
  end

  def install
    # The download is the bare binary, named after its platform.
    bin.install Dir["chessdrive_*"].first => "chessdrive"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/chessdrive version")
  end
end
