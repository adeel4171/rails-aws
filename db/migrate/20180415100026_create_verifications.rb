class CreateVerifications < ActiveRecord::Migration[5.1]
  def change
    create_table :verifications do |t|
	  t.string :verification_code
      t.timestamps
    end
  end
end
