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
      conf = Config.new(home_dir: File.join(@tmp_dir, '.rubybasic'))

      assert_equal File.join(@tmp_dir, '.rubybasic'), conf.home_dir
      assert_equal File.join(@tmp_dir, '.rubybasic/app'), conf.app_dir
    end

    def test_platform
      conf = Config.new(home_dir: File.join(@tmp_dir, '.rubybasic'))

      if RUBY_PLATFORM =~ /darwin/
        assert_equal :osx, conf.platform
        assert_equal File.join(@tmp_dir, '.rubybasic/app/osx'), conf.platform_dir
      end
    end

    def test_pickup_latest
      assert_equal nil    , Config.pickup_latest([])
      assert_equal "1.0.0", Config.pickup_latest(["1.0.0"])
      assert_equal "2.0.0", Config.pickup_latest(["1.0.0", "2.0.0"])
      assert_equal "10.0.0", Config.pickup_latest(["1.0.0", "10.0.0"])
      assert_equal "1.2.0", Config.pickup_latest(["1.2.0", "1.1.0"])
      assert_equal "1.2.3", Config.pickup_latest(["1.2.2", "0.2.3", "1.2.3"])
      assert_equal "1.2.3", Config.pickup_latest(["1.2", "1.2.3"])
      assert_equal "1.1.1.1", Config.pickup_latest(["1", "1.1.1", "1.1.1.1", "1.1"])
      assert_equal "1.0.101", Config.pickup_latest(["1.0.11", "1.0.101"])
    end
  end
end
