require 'rubybasic/cli'

require 'stringio'
require 'test/unit'

module Rubybasic
  class TestCLI < Test::Unit::TestCase
    def setup
      $stdout = StringIO.new
      @orig_stdout = $stdout
    end

    def teardown
      $stdout = @orig_stdout
    end

    def test_no_arg
      assert_match /Install RubyBasic binary/, command("")
    end

    # def test_install
    #   assert_match /install/, command("install")
    # end

    # def test_exec
    #   assert_match /exec/, command("exec")
    # end

    private

    def command(arg)
      CLI.start(arg.split)
      $stdout.string
    end
  end
end
