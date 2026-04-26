class BackendContextMcp < Formula
  desc "MCP Server that exposes Java backend API routes, VO schemas, and service logic to AI assistants"
  homepage "https://github.com/outhsics/backend-context-mcp"
  version "1.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/outhsics/backend-context-mcp/releases/download/v1.1.0/backend-context-mcp-darwin-arm64"
      sha256 "506dc32dabcea6b44c3d825aee8a5da27f1e832cac4ced5cc25ff81d61aba999"
    else
      url "https://github.com/outhsics/backend-context-mcp/releases/download/v1.1.0/backend-context-mcp-darwin-amd64"
      sha256 "2d7b6416de349716ce2a60b33913b25dee05c01480310c2c67c3a8dfef479b50"
    end
  end

  def install
    arch = Hardware::CPU.arm? ? "arm64" : "amd64"
    bin.install "backend-context-mcp-darwin-#{arch}" => "backend-context-mcp"
  end

  def caveats
    <<~EOS
      Usage:
        backend-context-mcp --dir /path/to/your/java/backend

      MCP config (.vscode/mcp.json):
        { "mcpServers": { "backend-context": { "url": "http://<ip>:3000/sse" } } }
    EOS
  end
end
