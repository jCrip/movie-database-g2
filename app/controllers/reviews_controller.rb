class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def create
    movie = Movie.find(params[:movie_id])
    # @review = Review.new
    # @review.content = params[:content]
    # @review.movie = movie
    # @review.author = params[:author]
    # @review.save

    # @review = Review.create(content: params[:content], movie: movie)

    @review = movie.reviews.build(review_params)
    @review.save

    redirect_to movie
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:content)
    end
end
