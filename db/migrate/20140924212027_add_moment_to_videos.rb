class AddMomentToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :moment, :datetime
  end
end
