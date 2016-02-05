class AddHourToCurtemphumis < ActiveRecord::Migration
  def change
    add_column :curtemphumis, :hour, :INTEGER
  end
end
