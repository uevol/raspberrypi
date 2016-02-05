class CreateCurtemphumis < ActiveRecord::Migration
  def change
    create_table :curtemphumis do |t|
      t.string :location
      t.decimal :temp
      t.decimal :humi
      t.string :time

      t.timestamps
    end
  end
end
