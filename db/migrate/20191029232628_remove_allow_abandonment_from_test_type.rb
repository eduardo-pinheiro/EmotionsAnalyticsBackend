class RemoveAllowAbandonmentFromTestType < ActiveRecord::Migration[5.2]
  def change
    remove_column :test_types, :allow_abandonment
  end
end
