class VisitorsController < ApplicationController
   def create
    @post = Post.friendly.find(params[:post_id])
   @visitor = @post.visitors.build(visitor_params)
   @visitor.save
      flash.now[:info] = "Thank you for your subscription!"
    redirect_to post_path(@post)
  end
  private
  def visitor_params
  	 params.require(:visitor).permit(:email, :name)
  	end

end
