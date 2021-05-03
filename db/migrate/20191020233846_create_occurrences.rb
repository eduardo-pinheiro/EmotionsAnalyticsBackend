class CreateOccurrences < ActiveRecord::Migration[5.2]
  def change
    create_table :occurrences do |t|
      t.references :test, foreign_key: true
      t.references :expression, foreign_key: true
      t.references :emotion, foreign_key: true

      t.timestamps
    end
  end
end
