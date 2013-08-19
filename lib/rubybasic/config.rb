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
      
      vers = versions.map{|v|
        {num: v.split('.').map{|i| Integer(i)}, str: v}
      }.sort {|a, b|
        # length = (a[:num].length < b[:num].length) ? a[:num].length : b[:num].length

        # (0...length).each do |i|
        #   r = b[:num][i] <=> a[:num][i]
        #   return r if r != 0
        # end
        
        r = b[:num][0] <=> a[:num][0]
        if r != 0
          r
        else
          r = b[:num][1] <=> a[:num][1]
          if r != 0
            r
          else
             b[:num][2] <=> a[:num][2]
          end
        end
      }
      
      vers.first[:str]
    end

    private

    def home
      File.expand_path '~'
    end
  end
end
