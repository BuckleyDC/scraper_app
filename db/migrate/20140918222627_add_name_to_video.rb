class AddNameToVideo < ActiveRecord::Migration
  def change
    add_column :videos, :Name, :string
  end
end
