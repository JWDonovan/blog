class PostsController < ApplicationController
    before_action :set_post, only: [:edit, :update]

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
            # redirect_to using slug instead of id for create and update functions 
        else
            # flash.now[:error] = error_message
            render :new
        end
    end

    def update
        @post = Post.find(params[:id])

        if @post.update(post_params)
            redirect_to @post
        else
            # flash.now[:error] = error_message
            render :edit
        end
    end

    def edit
        @form_title = "Edit Post"

        @post = Post.find_by_slug(params[:id])
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

    def set_post
        @post = Post.find_by_slug(params[:id])
    end

    # edit form should auto populate
    # make update method work
end
