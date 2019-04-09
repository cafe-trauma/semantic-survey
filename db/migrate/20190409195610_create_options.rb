class CreateOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :options do |t|
      t.belongs_to :question, index: true

      t.timestamps
    end
  end
end
