class VisitorsController < ApplicationController
   def create
    @post = Post.find(params[:post_id])
    @visitor = @post.visitorss.create(params[:visitor])
    redirect_to post_path(@post)
  end
end
