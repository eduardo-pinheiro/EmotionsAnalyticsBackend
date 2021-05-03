class CreateTests < ActiveRecord::Migration[5.2]
  def change
    create_table :tests do |t|
      t.boolean :abandoned
      t.references :test_type, foreign_key: true

      t.timestamps
    end
  end
end
