class AddDateToCurtemphumi < ActiveRecord::Migration
  def change
    add_column :curtemphumis, :date, :string
  end
end
