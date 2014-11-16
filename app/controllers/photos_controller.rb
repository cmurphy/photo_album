class PhotosController < ApplicationController
  before_filter :authenticate, :except => [:index, :show]

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)

    if @photo.save
      redirect_to @photo
    else
      render 'new'
    end
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def index
    @photos = Photo.all
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])

    if @photo.update(photo_params)
      redirect_to @photo
    else
      render 'edit'
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    redirect_to photos_path
  end

  def logged_in?
    session[:login]
  end

  private

  def photo_params
    params.require(:photo).permit(:name, :caption, :url)
  end

  def authenticate
    login = authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.secrets.admin_username && password == Rails.application.secrets.admin_password
    end
  end
end
