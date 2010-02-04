require File.join(File.dirname(__FILE__), 'user')
class TwoStateRule < User
  state :new do
    transitions { self.state = :has_name if name.present? }
  end
  
  state :has_name do
    transitions { self.state = :new if name.blank? }
  end
end