class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.references :user
      t.string :name
      t.float :amount

      t.timestamps
    end
  end
end
