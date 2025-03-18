class MoviesController < ApplicationController
  # Carrega os títulos e exibe em JSON, ordenados por ano de lançamento
  def index
    movies = Movie.order(:release_year)

    # Filtros (opcionais)
    movies = movies.where(release_year: params[:release_year]) if params[:release_year].present?
    movies = movies.where(genre: params[:genre]) if params[:genre].present?
    movies = movies.where(country: params[:country]) if params[:country].present?

    render json: movies
  end

  # Endpoint para carregar e salvar o arquivo CSV
  def import
    file = params[:file]
    if file.nil? || File.extname(file.original_filename) != ".csv"
      render json: { error: "Por favor, envie um arquivo CSV válido." }, status: :unprocessable_entity
      return
    end

    CSV.foreach(file.path, headers: true) do |row|
      # Evita duplicidade de registros com o `find_or_create_by`
      Movie.find_or_create_by(
        title: row["title"],
        release_year: row["release_year"].to_i,
        genre: row["genre"],
        country: row["country"]
      )
    end

    render json: { message: "Arquivo CSV importado com sucesso!" }, status: :ok
  end
end
