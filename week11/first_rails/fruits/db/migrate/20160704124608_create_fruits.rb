class CreateFruits < ActiveRecord::Migration[5.0]
  def change
    create_table :fruits do |t|
      t.text :name

      t.timestamps
    end
  end
end
