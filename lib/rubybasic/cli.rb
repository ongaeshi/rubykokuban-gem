require 'rubygems'
require 'thor'
require 'rubybasic/config'
# require 'rubybasic/cli_install'
# require 'rubybasic/cli_exec'

module Rubybasic
  class CLI < Thor
    desc "install", "Install RubyBasic binary"
    def install
      p "install"
      # CliCore.new.install
    end

    desc "exec", "Execute rubybasic's ruby file"
    def exec(*args)
      conf = Config.new

      case conf.platform
      when :osx
        app  = File.join(conf.platform_dir, "0.0.1", "RubyBasic.app") # Specify latest version
        args = args.map{|v| File.expand_path v}
        system("open #{app} --new --args #{args.join(" ")}")
      else
        raise "Not supported platform '#{conf.platform}'"
      end
    end
  end
end
