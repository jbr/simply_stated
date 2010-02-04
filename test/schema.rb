ActiveRecord::Schema.define :version => 0 do
  create_table :users, :force => true do |t|
    t.column :name, :string
    t.column :email_confirmed, :boolean, :default => false, :null => false
    t.column :approved, :boolean, :default => false, :null => false
    t.column :state, :string, :default => "new"
    t.column :type, :string
  end
end