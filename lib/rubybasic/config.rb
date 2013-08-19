require 'fileutils'

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
        nil
      end
    end

    def platform_dir(platform_sym = platform)
      File.join(app_dir, platform_sym.to_s)
    end

    def self.pickup_latest(versions)
      return nil if versions.empty?
      
      vers = versions.map{|str|
        {str: str, padding: str.split('.').map{|s| s.rjust(8 - s.length, '0')}.join('.') }
      }.sort {|a, b|
        b[:padding] <=> a[:padding]
      }
      
      vers.first[:str]
    end

    private

    def home
      File.expand_path '~'
    end
  end
end
