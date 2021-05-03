class CreateExpressions < ActiveRecord::Migration[5.2]
  def change
    create_table :expressions do |t|
      t.integer :attention
      t.integer :brow_furrow
      t.integer :brow_raise
      t.integer :cheek_raise
      t.integer :chin_raise
      t.integer :dimpler
      t.integer :eye_closure
      t.integer :eye_widen
      t.integer :inner_brow_raise
      t.integer :jaw_drop
      t.integer :lid_tighten
      t.integer :lip_corner_depressor
      t.integer :lip_press
      t.integer :lip_pucker
      t.integer :lip_stretch
      t.integer :lip_suck
      t.integer :mouth_open
      t.integer :nose_wrinkle
      t.integer :smile
      t.integer :smirk
      t.integer :upper_lip_raise

      t.timestamps
    end
  end
end
