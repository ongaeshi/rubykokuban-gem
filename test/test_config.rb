require 'rubybasic/config'

require 'test/unit'

module Rubybasic
  class TestConfig < Test::Unit::TestCase
    def setup
      @tmp_dir = File.join(File.dirname(__FILE__), "tmp")
      FileUtils.rm_rf(@tmp_dir)
      FileUtils.mkdir_p(@tmp_dir)
    end

    def teardown
      FileUtils.rm_rf(@tmp_dir)
    end
    
    def test_home_dir
      tmp_dir = File.join(File.dirname(__FILE__), 'tmp')

      conf = Config.new(home_dir: File.join(tmp_dir, '.rubybasic'))

      assert_equal File.join(tmp_dir, '.rubybasic'), conf.home_dir
      assert_equal File.join(tmp_dir, '.rubybasic/app'), conf.app_dir
    end

    def test_platform
      conf = Config.new

      if RUBY_PLATFORM =~ /darwin/
        assert_equal :osx, conf.platform
      end
    end
  end
end
