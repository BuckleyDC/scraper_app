class AddFirstDownloadToVideo < ActiveRecord::Migration
  def change
    add_column :videos, :first_download, :string
  end
end
