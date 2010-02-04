require File.instance_eval { expand_path join(dirname(__FILE__), 'test_helper') }

class TestSimplyStated < Test::Unit::TestCase
  context 'with a user' do
    setup do
      @user = User.new
    end
    
    should 'be in state new' do
      assert_state :new, @user
    end
    
    should 'not accept an invalid state' do
      exception = assert_raises(RuntimeError) {@user.state = :foo}
      assert_message "invalid state foo", exception
    end
    
    context 'with a known state' do
      setup { User.state :has_name }
      
      should 'accept symbol wibble as a state' do
        assert_nothing_raised {@user.state = :has_name}
      end

      should 'accept string wibble as a state' do
        assert_nothing_raised {@user.state = "has_name"}
      end
    end
    
    context 'with simple transition rules between new and has_name' do
      setup { @user = TwoStateRule.new }
      
      should 'list all the states' do
        assert_equal Set.new([:new, :has_name]), TwoStateRule.states
      end
      
      context 'when saved, the user' do
        setup {@user.save!}
        should 'stay in state new' do
          assert_state :new, @user
        end
      end
      
      context 'when the user has a name, they' do
        setup {@user.update_attributes! :name => "lorrie"}
        should 'transition to state has_name' do
          assert_state :has_name, @user
        end
      end
      
      context 'if the user is somehow put into the has_name state but has no name' do
        setup { @user.update_attributes! :state => :has_name }
        
        should 'stay in new state' do
          assert_state :new, @user
        end
      end
    end
    
    should 'test validations'
    should 'test validation inheritence'
    
    should 'test in_state named scope'
    should 'test not_in_state named scope'
  end
end
