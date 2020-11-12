class PostsController < ApplicationController
    def index
        @posts = Post.all
    end

    def new
        @form_title = "New Post"
        
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)

        if @post.save
            redirect_to @post
        else
            # flash.now[:error] = error_message
            render :new
        end
    end

    def edit
        @form_title = "Edit Post"

        @post
    end

    def show
        @post = Post.find_by_slug(params[:id])
    end

    def destroy
        @post = Post.find_by_slug(params[:id])
        @post.destroy

        redirect_to posts_path
    end

    def latest
        @post = Post.order(created_at: :desc).first
        redirect_to action: "show", id: @post.slug
    end

    private

    def post_params
        params.require(:post).permit(:title, :slug, :subtitle, :datetime, :hero_image, :body, :published, :comments_enabled)
    end

    # edit form should auto populate
    # make update method work
end
