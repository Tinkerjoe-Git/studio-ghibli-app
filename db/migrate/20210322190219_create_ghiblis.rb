class CreateGhiblis < ActiveRecord::Migration[5.2]
  def change
    create_table :ghiblis do |t|
      t.string :title
      t.string :original_title
      t.string :description
      t.string :director
      t.integer :release_date
      t.string :rt_score
      t.string :people
      t.string :user_film_reviews
      t.integer :user_id
    end
  end
end
