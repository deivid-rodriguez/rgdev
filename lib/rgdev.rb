require "optparse"

module Rgdev
  VERSION = "4.0.0"

  RGDEV_HOME = "rgdev-home-#{Dir.pwd.gsub('/', '-').gsub(' ', '-')}"

  def self.run(cmd)
    volumes = "-v #{RGDEV_HOME}:/home/developer:z -v #{Dir.pwd}:#{Dir.pwd}:z"
    uid     = Process.uid

    exec "docker run --rm -it -u #{uid} #{volumes} -w #{Dir.pwd} duckinator/rgdev #{cmd.join(' ')}"
  end

  def self.reset
    exec "docker volume rm #{RGDEV_HOME}"
  end


  Options = Struct.new(:version, :reset, :help, :command)
  def self._parse_args(argv)
    argv = argv.dup

    args = Options.new(false, false, false, nil)

    opt_parser = OptionParser.new do |opts|
      opts.banner = "Usage: rgdev [--reset|--verbose|COMMAND]"

      opts.on("--version", "Show version information and exit.") do
        args.version = true
      end

      opts.on("--reset", "Remove all docker volumes used for the current directory.") do
        args.reset = true
      end

      opts.on("-h", "--help", "Print this help text.") do
        args.help = true
      end
    end

    opt_parser.parse!(argv)
    args.command = argv
    return [args, opt_parser]
  end
end
