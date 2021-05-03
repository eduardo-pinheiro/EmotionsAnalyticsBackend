class AddPeopleAppearanceToOccurrence < ActiveRecord::Migration[5.2]
  def change
    add_reference :occurrences, :people_appearance
  end
end
