class DeleteEmailToUsers < ActiveRecord::Migration[5.1]
  def change
  	remove_column :users, :email
  	add_index :users, :mobile_number
  end
end
