class CreateKnowhows < ActiveRecord::Migration[5.2]
  def change
    create_table :knowhows do |t|
      t.string :content
      t.string :title
      t.references :pocket, foreign_key: true
      t.boolean :posted

      t.timestamps
    end
  end
end
