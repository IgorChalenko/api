class AddEmailIndex < ActiveRecord::Migration[6.1]
  def change
    add_index :users, :email
  end
end