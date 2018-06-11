class ReviewsController < ApplicationController

	def create
		@review = current_user.reviews.create(review_params)
		redirect_to @review.item
	end

	def destroy
		@review = Review.find(params[:id])
		item = @review.item
		@review.destroy

		redirect_to item
	end

	private
		def review_params
			params.require(:review).permit(:comment, :star, :item_id)
		end
end