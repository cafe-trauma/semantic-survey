class CreateTriples < ActiveRecord::Migration[5.2]
  def change
    create_table :triples do |t|
      t.belongs_to :option, index: true
      t.string :s
      t.string :p
      t.string :o

      t.timestamps
    end
  end
end
