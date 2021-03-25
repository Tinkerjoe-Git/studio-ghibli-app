class Renameghiblistoreviews < ActiveRecord::Migration[5.2]
  def up
    rename_table :ghiblis, :reviews
  end

  def down
    rename_table :reviews, :ghiblis
  end

end
