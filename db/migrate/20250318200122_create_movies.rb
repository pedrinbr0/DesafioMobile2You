class CreateMovies < ActiveRecord::Migration[7.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :release_year
      t.string :genre
      t.string :country

      t.timestamps
    end
  end
end
