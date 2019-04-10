class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :text
      t.string :q_type
      t.string :category
      t.string :short_name
      t.integer :order

      t.timestamps
    end
  end
end
