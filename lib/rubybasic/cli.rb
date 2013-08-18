require 'rubygems'
require 'thor'
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
    def exec(arg)
      p "exec #{arg}"
      # CliCore.new.exec
    end
  end
end
