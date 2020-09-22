class Hzcloud < Formula
  desc "Hazelcast Cloud Enterprise is an enterprise-grade, on-demand managed service for Hazelcast IMDG"
  homepage "http://cloud.hazelcast.com/"
  url "https://github.com/hazelcast/hazelcast-cloud-cli/archive/v0.0.4.tar.gz"
  sha256 "cbfd79c42f2923fc33e1408a83886fff8fbe0e66d6a79c58f1c27f210dd825bf"
  depends_on "go" => :build
  
  def install
      ENV["GOPATH"] = buildpath
      bin_path = buildpath/"src/github.com/hazelcast/hazelcast-cloud-cli"
      bin_path.install Dir["*"]
      cd bin_path do
        system "go", "build", "-ldflags", "-X github.com/hazelcast/hazelcast-cloud-cli/internal.Version=#{version} -X github.com/hazelcast/hazelcast-cloud-cli/internal.Distribution=BREW", "-o", bin/"hzcloud", "."
      end
  end

  test do
    system "false"
  end
end
