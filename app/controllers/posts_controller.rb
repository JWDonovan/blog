class PostsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show, :latest]
    before_action :set_post, only: [:show, :edit, :update, :destroy]

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
            redirect_to "/posts/#{@post.slug}"
        else
            # flash.now[:error] = error_message
            render :new
        end
    end

    def update
        if @post.update(post_params)
            redirect_to "/posts/#{@post.slug}"
        else
            # flash.now[:error] = error_message
            render :edit
        end
    end

    def edit
        @form_title = "Edit Post"
    end

    def show
    end

    def destroy
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
end
