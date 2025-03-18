namespace :import_csv do
  desc "Importa dados do arquivo CSV para o banco de dados"
  task movies: :environment do
    require 'csv'

    # Caminho correto para o arquivo CSV
    file_path = Rails.root.join('lib', 'tasks', 'netflix_titles.csv')

    # Verifica se o arquivo existe antes de processar
    unless File.exist?(file_path)
      puts "Erro: Arquivo CSV não encontrado em #{file_path}"
      exit
    end

    # Importação dos dados
    CSV.foreach(file_path, headers: true) do |row|
      Movie.find_or_create_by(
        title: row['title'],
        release_year: row['release_year'],
        genre: row['genre'],
        country: row['country']
      )
    end

    puts "Importação concluída com sucesso!"
  end
end
