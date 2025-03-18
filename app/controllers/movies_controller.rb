class MoviesController < ApplicationController
  def index
    movies = Movie.all.order(release_year: :asc)

    movies = movies.where(release_year: params[:release_year]) if params[:release_year].present?
    movies = movies.where(genre: params[:genre]) if params[:genre].present?
    movies = movies.where(country: params[:country]) if params[:country].present?

    render json: movies
  end

  def import
    file = params[:file]
    if file.nil? || File.extname(file.original_filename) != ".csv"
      render json: { error: "Por favor, envie um arquivo CSV válido." }, status: :unprocessable_entity
      return
    end

    CSV.foreach(file.path, headers: true) do |row|
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
