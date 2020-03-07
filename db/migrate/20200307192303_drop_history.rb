class DropHistory < ActiveRecord::Migration
  def change
    drop_table :history
  end
end
