class CreateEmotions < ActiveRecord::Migration[5.2]
  def change
    create_table :emotions do |t|
      t.integer :anger
      t.integer :contempt
      t.integer :disgusted
      t.integer :fear
      t.integer :joy
      t.integer :sadness
      t.integer :valence
      t.integer :engagement

      t.timestamps
    end
  end
end
