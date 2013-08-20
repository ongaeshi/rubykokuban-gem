# -*- coding: utf-8 -*-
require 'rubygems'
require 'thor'
require 'rubybasic/config'
require 'rubybasic/gem/version'

module Rubybasic
  class CLI < Thor
    class_option :help, :type => :boolean, :aliases => '-h', :desc => 'Help message'
    class_option :version, :type => :boolean, :desc => 'Show version.'

    desc "install [options]", "Install RubyBasic binary"
    option :latest, :type => :boolean, :desc => 'Install latest version'
    def install
      if options.empty?
        CLI.task_help(shell, "install")
        return
      end

      p "install #{options}"
    end

    desc "exec [input_file]", "Execute rubybasic file"
    def exec(*args)
      if args.empty?
        CLI.task_help(shell, "exec")
        return
      end
      
      conf = Config.new

      case conf.platform
      when :osx
        app  = File.join(conf.latest_dir, "RubyBasic.app")
        args = args.map{|v| File.expand_path v}
        system("open #{app} --new --args #{args.join(" ")}")
      else
        raise "Not supported platform '#{conf.platform}'"
      end
    end

    no_tasks do
      # Override method for support -h 
      # defined in /lib/thor/invocation.rb
      def invoke_command(task, *args)
        if options[:help]
          CLI.task_help(shell, task.name)
        elsif options[:version] && task.name == 'help'
          puts "rubybasic #{Rubybasic::Gem::VERSION}"
        else
          super
        end
      end
    end
  end
end
