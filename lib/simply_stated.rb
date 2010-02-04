module SimplyStated
  def self.included(klass)
    klass.instance_eval do
      extend ClassMethods
      before_validation :transition
      cattr_accessor :states
      cattr_accessor :state_validation_hash
      named_scope :in_state, lambda {|*s| {:conditions => ['state in (?)', s.map(&:to_s)]}}
      named_scope :not_in_state, lambda {|*s| {:conditions => ['state not in (?)', s.map(&:to_s)]}}
      self.state_validation_hash = {}
    end
  end
  
  def state() self[:state].try :to_sym end
  
  def state=(state)
    if self.class.states.include?(state.to_sym)
      self[:state] = state.to_s
      transition
    else
      raise "invalid state #{state}"
    end
  end
    
  def transition
    state_before = state
    soft_send :"transition_from_#{state}"
    transition unless state_before == state
    state
  end
  
  module ClassMethods
    def state(state_name, &blk)
      state_name = state_name.to_sym
      State.new(state_name, self).instance_eval(&blk) if blk
      (self.states ||= []) << state_name
      (self.state_validation_hash[state_name] ||= []) << state_name
      
      define_method(:"in_state_#{state_name}?") {state == state_name}
      define_method :"run_validations_for_state_#{state_name}?" do
        state_validation_hash[state_name].include? self.state
      end
    end
    
    def transition_from(state, &blk)
      define_method :"transition_from_#{state}", &blk
    end
    
    def state_validations(state, *base_states, &blk)
      base_states.each do |base_state|
        (state_validation_hash[base_state.to_sym] ||= []) << state.to_sym
      end
      
      if blk
        with_options :if => :"run_validations_for_state_#{state}?" do |validation_proxy|
          validation_proxy.instance_eval(&blk)
        end
      end
    end
  end
  
  
  class State
    attr_accessor :klass, :name
    def initialize(name, klass) self.klass, self.name = klass, name end
    def transitions(&blk) klass.transition_from(name, &blk) end
    def validations(*args, &blk) klass.state_validations(name, *args, &blk) end
  end
end