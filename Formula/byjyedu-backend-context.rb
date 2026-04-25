class ByjyeduBackendContext < Formula
  desc "Backend context MCP Server for Java backend API/VO/Service info"
  homepage "https://github.com/outhsics/backend-context-mcp"
  version "1.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/outhsics/backend-context-mcp/releases/download/v1.0.0/byjyedu-backend-context-darwin-arm64"
      sha256 "0606252cea2cae5a4951b34db32746ed8f7d871b7c947591e4e4ec976729f03a"
    else
      url "https://github.com/outhsics/backend-context-mcp/releases/download/v1.0.0/byjyedu-backend-context-darwin-amd64"
      sha256 "97d20ea21dc5fffb26fe3320d0f404d1a27092a3ec1421deac66cf07cc679e61"
    end
  end

  def install
    bin.install "byjyedu-backend-context-darwin-#{Hardware::CPU.arm? ? "arm64" : "amd64"}" => "byjyedu-backend-context"
  end

  def caveats
    <<~EOS
      Usage:
        byjyedu-backend-context --dir /path/to/your/java/backend
    EOS
  end
end
