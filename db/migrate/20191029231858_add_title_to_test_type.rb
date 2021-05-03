class AddTitleToTestType < ActiveRecord::Migration[5.2]
  def change
    add_column :test_types, :title, :string
  end
end
