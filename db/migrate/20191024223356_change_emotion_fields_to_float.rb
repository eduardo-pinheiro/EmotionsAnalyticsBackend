class ChangeEmotionFieldsToFloat < ActiveRecord::Migration[5.2]
  def change
    change_column :emotions, :anger, :float
    change_column :emotions, :contempt, :float
    change_column :emotions, :disgusted, :float
    change_column :emotions, :fear, :float
    change_column :emotions, :joy, :float
    change_column :emotions, :sadness, :float
    change_column :emotions, :valence, :float
    change_column :emotions, :engagement, :float
  end
end
