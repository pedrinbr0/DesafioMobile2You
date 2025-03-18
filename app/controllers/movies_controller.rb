class MoviesController < ApplicationController
  def index
    movies = Movie.all
    movies = movies.where(release_year: params[:release_year]) if params[:release_year].present?
    movies = movies.where(genre: params[:genre]) if params[:genre].present?
    movies = movies.where(country: params[:country]) if params[:country].present?
    movies = movies.order(:release_year)

    render json: movies
  end

  def import
    file = params[:file]
    return render json: { error: 'Nenhum arquivo enviado' }, status: :unprocessable_entity unless file.present?

    CSV.foreach(file.path, headers: true) do |row|
      Movie.find_or_create_by(
        title: row['title'],
        release_year: row['release_year'],
        genre: row['genre'],
        country: row['country']
      )
    end

    render json: { message: 'Importação concluída com sucesso' }
  end
end
