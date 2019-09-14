module Rgdev
  VERSION = "3.0.2"

  RGDEV_HOME = "rgdev-home-#{Dir.pwd.gsub('/', '-').gsub(' ', '-')}"

  def self.run(cmd)
    volumes = "-v #{RGDEV_HOME}:/home/developer:z -v #{Dir.pwd}:#{Dir.pwd}:z"
    uid     = Process.uid

    exec "docker run --rm -it -u #{uid} #{volumes} -w #{Dir.pwd} whaledo/rgdev #{cmd.join(' ')}"
  end

  def self.remove_home_volume()
    result = `docker volume rm #{RGDEV_HOME}`
    exit_code = $?
    unless result.start_with?('Error: No such volume: ')
      puts result
    end
    exit $?
  end
end
