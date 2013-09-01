require 'fileutils'
require 'json'
require 'open-uri'

module Rubybasic
  class Config
    def initialize(opts = {})
      @opts = opts
    end

    def home_dir
      # First setting.
      #   1. Set value to @home_dir
      #   2. Create directory does not exist
      unless @home_dir
        @home_dir = @opts[:home_dir] || File.join(home, '.rubybasic')
        FileUtils.mkdir_p(@home_dir) unless File.exist?(@home_dir)
      end
      
      @home_dir
    end

    def app_dir
      File.join(home_dir, 'app')
    end

    def platform
      if RUBY_PLATFORM =~ /mswin(?!ce)|mingw|cygwin|bccwin/
        :win
      elsif RUBY_PLATFORM =~ /darwin/
        :osx
      else
        :etc
      end
    end

    def platform_dir(platform_sym = platform)
      File.join(app_dir, platform_sym.to_s)
    end

    def self.sort_versions(versions)
      vers = versions.map{|str|
        {str: str, padding: str.split('.').map{|s| s.rjust(8 - s.length, '0')}.join('.') }
      }.sort {|a, b|
        b[:padding] <=> a[:padding]
      }.map {|a|
        a[:str]
      }
    end

    def versions
      versions = Dir.glob(File.join(platform_dir, "*")).map {|path| File.basename(path)}

      versions.map{|str|
        {str: str, padding: str.split('.').map{|s| s.rjust(8 - s.length, '0')}.join('.') }
      }.sort {|a, b|
        b[:padding] <=> a[:padding]
      }.map {|a|
        a[:str]
      }
    end

    def latest_dir
      File.join(platform_dir, versions.first)
    end

    def install_dir(version = nil)
      File.join(platform_dir, version || versions.first)
    end

    def install_latest_version
      src  = open("https://api.github.com/repos/ongaeshi/rubybasic-#{platform.to_s}/releases").read
      json = JSON.parse(src)
      # p json
      json[0]['tag_name'][1..-1] # 'v0.2.0' -> '0.2.0'
    end
      
    private

    def home
      File.expand_path '~'
    end
  end
end
