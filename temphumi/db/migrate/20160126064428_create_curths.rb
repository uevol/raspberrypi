class CreateCurths < ActiveRecord::Migration
  def change
    create_table :curths do |t|
      t.string :location
      t.string :date
      t.string :time
      t.decimal :temp
      t.decimal :humi
      t.integer :hour

      t.timestamps
    end
  end
end
