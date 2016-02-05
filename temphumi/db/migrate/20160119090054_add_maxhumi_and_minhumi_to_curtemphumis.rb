class AddMaxhumiAndMinhumiToCurtemphumis < ActiveRecord::Migration
  def change
    add_column :curtemphumis, :maxhumi, :decimal
    add_column :curtemphumis, :minhumi, :decimal
  end
end
