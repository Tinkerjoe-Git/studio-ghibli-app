class FixColumnName < ActiveRecord::Migration[5.2]
  def up
    rename_column :ghiblis, :user_film_reviews, :reviews
  end

  def down
  end
end
