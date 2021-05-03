class AddForeignKeyPeopleAppearanceToOccurrence < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :occurrences, :people_appearances
  end
end
