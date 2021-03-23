class CreateGhibli < ActiveRecord::Migration[6.0]
  def change
    create_table :ghibli_films do |t|
      t.integer :id
      t.string :title
      t.string :original_title
      t.string :original_title_romanised
      t.string :description
      t.string :director
      t.string :producer
      t.integer :release_date
      t.integer :running_time
      t.string :rt_score
      t.string :people
      t.string :species
      t.string :locations
      t.string :vehicles
      t.string :url
    end
  end
end
