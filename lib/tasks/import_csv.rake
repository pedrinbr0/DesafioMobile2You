task :import_csv => :environment do
  require 'csv'
  file_path = 'path/para/seu/netflix_titles.csv'

  CSV.foreach(file_path, headers: true) do |row|
    Movie.find_or_create_by(
      title: row['title'],
      release_year: row['release_year'],
      genre: row['genre'],
      country: row['country']
    )
  end
end
