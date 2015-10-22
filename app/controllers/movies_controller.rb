class MoviesController < ApplicationController
  # before_action :set_movie, only: [:show, :edit, :update, :destroy, :set_genre, :like]

  # before_action :authenticate_user!, except: [:index, :show]
  # before_action :check_editor!, only: [:edit, :update]
  # before_action :check_admin!, only: [:destroy]

  load_and_authorize_resource

  # GET /movies
  # GET /movies.json
  def index
    @movies = Movie.all
    @genres = Genre.all
  end

  # GET /movies/1
  # GET /movies/1.json
  def show
    @reviews = @movie.reviews.reverse
    @genres = Genre.all
    @movie_genres = @movie.genres
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit
  end

  # POST /movies
  # POST /movies.json
  def create
    @movie = Movie.new(movie_params)
    @movie.user = current_user if user_signed_in?

    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1
  # PATCH/PUT /movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: 'Movie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def set_genre
    if params.key?(:genres_ids) && !params[:genres_ids].empty?
      @genres = Genre.find(params[:genres_ids])
      @movie.genres = @genres
    else
      @movie.genres.clear
    end

    redirect_to @movie
  end

  def set_genres
    if params.key?(:genres_ids) && !params[:genres_ids].empty? && params.key?(:movies_ids) && !params[:movies_ids].empty?
      @movies = Movie.find(params[:movies_ids])
      @genres = Genre.find(params[:genres_ids])
      @movies.each do |movie|
        movie.genres = @genres
      end
      redirect_to root_path, notice: 'Genero(s) asignado correctamente.'
    else
      redirect_to root_path, alert: 'Tienes que seleccionar al menos un genero y una pelicula'
    end
  end

  def like
    @like = @movie.likes.build(user: current_user)

    if @movie.liked_by? current_user
      @movie.remove_like current_user
      redirect_to @movie, notice: 'Tu like a sido eliminado :('
    elsif @movie.save
      redirect_to @movie, notice: 'Gracias por tu like :D'
    else
      redirect_to @movie, notice: 'Tu like no se ha guardado :('
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_params
      params.require(:movie).permit(:title, :description, :realease_date, :studio)
    end
end
