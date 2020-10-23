class Hzcloud < Formula
  desc "Hazelcast Cloud Enterprise is an enterprise-grade, on-demand managed service for Hazelcast IMDG"
  homepage "http://cloud.hazelcast.com/"
  url "https://github.com/hazelcast/hazelcast-cloud-cli/archive/v1.1.0.tar.gz"
  sha256 "b2fa7c07809e137ee0ce316bf32cd56a349e58929db88988371001952ebc9ce5"
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
