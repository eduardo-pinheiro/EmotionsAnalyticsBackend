class CreateTestType < ActiveRecord::Migration[5.2]
  def change
    create_table :test_types do |t|
      t.text :start_url
      t.text :objective
      t.boolean :allow_abandonment
    end
  end
end
