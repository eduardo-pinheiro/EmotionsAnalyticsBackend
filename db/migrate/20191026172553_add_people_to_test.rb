class AddPeopleToTest < ActiveRecord::Migration[5.2]
  def change
    add_reference :tests, :people
  end
end
