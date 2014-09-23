class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.integer :user_id
      t.string :account_number
      t.decimal :balance, precision: 10, scale: 2, default: 0

      t.timestamps
    end
  end
end
