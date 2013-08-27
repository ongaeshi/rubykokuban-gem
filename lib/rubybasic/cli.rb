# -*- coding: utf-8 -*-
require 'rubygems'
require 'fetcher'
require 'fileutils'
require 'rubybasic/config'
require 'rubybasic/gem/version'
require 'rubybasic/utils'
require 'thor'

module Rubybasic
  class CLI < Thor
    class NotFoundError < RuntimeError ; end

    class_option :help, :type => :boolean, :aliases => '-h', :desc => 'Help message'
    class_option :version, :type => :boolean, :desc => 'Show version.'

    desc "install [options]", "Install RubyBasic binary"
    option :latest, :type => :boolean, :desc => 'Install latest version'
    def install
      if options.empty?
        CLI.task_help(shell, "install")
        return
      end

      conf = Config.new

      case conf.platform
      when :osx
      else
        raise "Not supported platform '#{conf.platform}'"
      end

      logger = Logger.new(STDOUT)
      logger.level = Logger::INFO
      worker = Fetcher::Worker.new(logger)

      platform = conf.platform.to_s
      puts "Search latest version ..."
      version  = conf.install_latest_version
      
      url      = "https://github.com/ongaeshi/rubybasic-#{platform}/releases/download/v#{version}"
      filename = "rubybasic-#{platform}-#{version}.zip"
      src      = File.join(url, filename)
      dst      = File.join(conf.install_dir(version), filename)

      puts "Download #{src}"
      worker.copy(src, dst)
      puts "Unzip #{dst}"
      system("unzip -q #{dst} -d #{File.dirname(dst)}")
      # Utils.zip_extract(dst, File.dirname(dst), {no_dir: true})
      FileUtils.rm_f dst
    end

    desc "exec [input_file]", "Execute rubybasic file"
    def exec(*args)
      if args.empty?
        CLI.task_help(shell, "exec")
        return
      end
      
      conf = Config.new

      begin
        case conf.platform
        when :osx
          # p conf.latest_dir
          app  = File.join(conf.latest_dir, "RubyBasic.app")
          args = args.map {|v|
            raise NotFoundError, "Not found '#{v}'" unless File.exist?(v)
            File.expand_path(v)
          }
          system("open #{app} --new --args #{args.join(" ")}")
        else
          raise "Not supported platform '#{conf.platform}'"
        end
      rescue NotFoundError => e
        puts e.message
      end
    end

    desc "list", "Display installed version"
    def list
      conf = Config.new
      puts "#{conf.platform.to_s} (#{conf.versions.join(', ')})"
    end

    desc "uninstall", "Uninstall rubybasic from the local repository"
    option :version, :aliases => '-v', :type => :string, :desc => 'Specify version'
    def uninstall
      conf = Config.new

      if options[:version]
        uninstall_dir = File.join(conf.platform_dir, options[:version])

        if File.exist?(uninstall_dir)
          FileUtils.rm_rf uninstall_dir
          puts "Successfully uninstalled #{uninstall_dir}"
        else
          puts "Not found #{uninstall_dir}"
        end
      else
        puts "Please specify version with '-v'"
        puts conf.versions.map {|v| "  #{v}"}.join("\n")
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
