class PostsController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_post, only: [:show, :update, :destroy]
  #after_action :render_result, only: [:search_by_param, :search_by_page, :search_one]
  def search_by_param
    title = params[:title];
    body = params[:body];
    published_at = params[:published_at]
    if published_at == nil
      published_at = Time.now
    else
      published_at = DateTime.parse(published_at)
    end
    errors = [];
    errors.push("title is required") if title == nil
    errors.push("body is required") if body == nil

    p "title is #{title} body is #{body} published_at is #{published_at}"

    if (errors.size > 0)
      render :json=>{:errors=>errors}
    else

      @posts = Post.where(title: title, body: body, published_at: published_at)
      render :json=> @posts, :methods =>[:author_nickname],
    :except => [:created_at, :updated_at, :author_id]
    end
  end

  # actioni for_api
  def search_by_page
    p 'the page is '
    p params.to_json
    page = params[:page].to_i
    per_page = params[:per_page].to_i
    p "page is #{page}, per_page is #{per_page}"

    params_str = params[:params]
    @posts = Post.all.includes(:author).order(:published_at).limit(per_page).offset(page*per_page)

    render :json=> @posts, :methods =>[:author_nickname],
     :except => [:created_at, :updated_at, :author_id]
  end

  def search_one
    @post = Post.find(params[:post_id])
    render :json=> @post, :methods =>[:author_nickname],
     :except => [:created_at, :updated_at, :author_id]
  end

  # GET /posts
  def index
    @posts = Post.all

    render json: @posts
  end

  # GET /posts/1
  def show
    render json: @post
  end

  # POST /posts
  def create
    @post = Post.new(post_params)

    if @post.save
      render json: @post, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def post_params
    params.require(:post).permit(:title, :body, :author, :published_at)
  end
end
