class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :library
      t.string :title

      t.timestamps
    end
  end
end
