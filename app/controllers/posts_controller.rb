class PostsController < ApplicationController
	before_action :find_post, only: [:edit, :update, :show, :delete]

	# Index action to render all posts
	
   def index  
     if params[:tag]
       @posts = Post.tagged_with(params[:tag])
     else
      @posts = Post.all.paginate(page: params[:page], per_page: 10)
     end
 end

 def admin_index  
     if params[:tag]
       @posts = Post.tagged_with(params[:tag])
     else
      @posts = Post.all.paginate(page: params[:page], per_page: 20)
     end
 end

	# New action for creating post
	def new
		@post = Post.new
	end

	# Create action saves the post into database
	def create
		@post = Post.new(post_params)
		if @post.save
			flash[:notice] = "Successfully created post!"
			redirect_to post_path(@post)
		else
			flash[:alert] = "Error creating new post!"
			render :new
		end
	end

	# Edit action retrives the post and renders the edit page
	def edit
	end

	# Update action updates the post with the new information
	def update
		if @post.update_attributes(post_params)
			flash[:notice] = "Successfully updated post!"
			redirect_to post_path
		else
			flash[:alert] = "Error updating post!"
			render :edit
		end
	end

	# The show action renders the individual post after retrieving the the id
	def show
	end

	# The destroy action removes the post permanently from the database
	def destroy
		@post= Post.friendly.find(params[:id])
		@post.destroy
			flash[:notice] = "Successfully deleted post!"
			redirect_to allposts_path
		
	end

	private

	def post_params
		params.require(:post).permit(:title, :picture, :body, :tag_list)
	end

	def find_post
		@post = Post.friendly.find(params[:id])
	end
	def tagged
  if params[:tag].present? 
    @posts = Post.tagged_with(params[:tag])
  else 
    @posts = Post.postall
  end  
end
end
