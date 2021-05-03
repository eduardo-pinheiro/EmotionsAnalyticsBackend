class ChangeExpressionsFieldsToFloat < ActiveRecord::Migration[5.2]
    def change
      change_column :expressions, :attention, :float
      change_column :expressions, :brow_furrow, :float
      change_column :expressions, :brow_raise, :float
      change_column :expressions, :cheek_raise, :float
      change_column :expressions, :chin_raise, :float
      change_column :expressions, :dimpler, :float
      change_column :expressions, :eye_closure, :float
      change_column :expressions, :eye_widen, :float
      change_column :expressions, :inner_brow_raise, :float
      change_column :expressions, :jaw_drop, :float
      change_column :expressions, :lid_tighten, :float
      change_column :expressions, :lip_corner_depressor, :float
      change_column :expressions, :lip_press, :float
      change_column :expressions, :lip_pucker, :float
      change_column :expressions, :lip_stretch, :float
      change_column :expressions, :lip_suck, :float
      change_column :expressions, :mouth_open, :float
      change_column :expressions, :nose_wrinkle, :float
      change_column :expressions, :smile, :float
      change_column :expressions, :smirk, :float
      change_column :expressions, :upper_lip_raise, :float
    end
end
