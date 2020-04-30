class CreatePockets < ActiveRecord::Migration[5.2]
  def change
    create_table :pockets do |t|
      t.string :pocket_name
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
