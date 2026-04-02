class PgPartman < Formula
  desc "Partition management extension for PostgreSQL"
  homepage "https://github.com/pgpartman/pg_partman"
  url "https://github.com/pgpartman/pg_partman/archive/refs/tags/v5.4.3.tar.gz"
  sha256 "c52e3b8cf80d306468f48fbdb1905e4c2574bf8362240af57aebbbf9e18c6fe2"
  license "PostgreSQL"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on "postgresql@16" => [:build, :test]

  def postgresqls
    deps.map(&:to_formula).sort_by(&:version).filter { |f| f.name.start_with?("postgresql@") }
  end

  def install
    postgresqls.each do |postgresql|
      ENV["PG_CONFIG"] = postgresql.opt_bin/"pg_config"

      system "make"
      system "make", "install", "bindir=#{bin}",
                                "docdir=#{doc}",
                                "datadir=#{share/postgresql.name}",
                                "pkglibdir=#{lib/postgresql.name}"
      system "make", "clean"
    end
  end

  def caveats
    cmds = postgresqls.map do |postgresql|
      pg_share = postgresql.opt_share/postgresql.name/"extension"
      pg_lib = postgresql.opt_lib/"postgresql"
      <<~EOS
        # #{postgresql.name}
        ln -sf #{opt_share/postgresql.name}/extension/pg_partman* #{pg_share}/
        ln -sf #{opt_lib/postgresql.name}/pg_partman* #{pg_lib}/
      EOS
    end.join("\n")

    <<~EOS
      To make pg_partman visible to PostgreSQL, symlink the extension files:

      #{cmds}
    EOS
  end

  test do
    ENV["LC_ALL"] = "C"
    postgresqls.each do |postgresql|
      pg_ctl = postgresql.opt_bin/"pg_ctl"
      psql = postgresql.opt_bin/"psql"
      port = free_port

      datadir = testpath/postgresql.name
      system pg_ctl, "initdb", "-D", datadir
      (datadir/"postgresql.conf").write <<~EOS, mode: "a+"

        shared_preload_libraries = 'pg_partman_bgw'
        port = #{port}
      EOS
      system pg_ctl, "start", "-D", datadir, "-l", testpath/"log-#{postgresql.name}"
      begin
        system psql, "-p", port.to_s, "-c", "CREATE EXTENSION \"pg_partman\";", "postgres"
      ensure
        system pg_ctl, "stop", "-D", datadir
      end
    end
  end
end
