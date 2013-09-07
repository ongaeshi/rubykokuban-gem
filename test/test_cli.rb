require 'kokuban/cli'

require 'stringio'
require 'test/unit'

module Kokuban
  class TestCLI < Test::Unit::TestCase
    def setup
      $stdout = StringIO.new
      @orig_stdout = $stdout
    end

    def teardown
      $stdout = @orig_stdout
    end

    def test_no_arg
      assert_match /exec.*help.*install/m, command("")
    end

    def test_help
      assert_match /exec.*help.*install/m, command("-h")
    end

    def test_install_no_arg
      assert_match /Usage.*install/m, command("install")
    end

    def test_install_latest
      # puts command("install --latest")
    end

    def test_exec_no_arg
      assert_match /Usage.*exec/m, command("exec")
    end

    def test_exec_help
      assert_match /Usage.*exec/m, command("exec -h")
    end

    def test_list_no_arg
      command("list")
    end

    def test_list_help
      assert_match /Usage.*list/m, command("list -h")
    end

    private

    def command(arg)
      CLI.start(arg.split)
      $stdout.string
    end
  end
end
