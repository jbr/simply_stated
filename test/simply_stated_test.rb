require File.instance_eval { expand_path join(dirname(__FILE__), 'test_helper') }
require 'active_record'

class TestSimplyStated < Test::Unit::TestCase
  should 'write the tests'
end
