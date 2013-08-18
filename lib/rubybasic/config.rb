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

    private

    def home
      File.expand_path '~'
    end
  end
end
