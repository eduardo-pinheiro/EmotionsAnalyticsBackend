class CreatePeopleAppearance < ActiveRecord::Migration[5.2]
  def change
    create_table :people_appearances do |t|
      t.integer :age
      t.text :gender
      t.integer :glasses
    end
  end
end
