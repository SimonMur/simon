class SubscribesController < ApplicationController
def new
		@subscribe = Subscribe.new
	end
# Create action saves the post into database
	def create
		@subscribe = Subscribe.new(subscribe_params)
		if @subscribe.save
			flash[:notice] = "Thank you for your subscription"
			redirect_to post_path(@post)
		else
			flash[:alert] = "Error in Subscription"
			render :new
		end
	end
	private

	def subscribe_params
		params.require(:subscribe).permit(:name, :email)
	end
end
