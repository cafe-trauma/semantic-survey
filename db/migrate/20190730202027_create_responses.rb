class CreateResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :responses do |t|
      t.references :organization, foreign_key: true
      t.references :option, foreign_key: true
      t.text :text_value

      t.timestamps
    end
  end
end
