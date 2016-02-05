class AddMaxtempAndMintempToCurtemphumis < ActiveRecord::Migration
  def change
    add_column :curtemphumis, :maxtemp, :decimal
    add_column :curtemphumis, :mintemp, :decimal
  end
end
