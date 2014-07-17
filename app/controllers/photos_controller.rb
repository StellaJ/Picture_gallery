class PhotosController < ApplicationController

  layout 'admin'

  before_action :check_logon

  def index
    @photos = Photo.sort
  end

  def new
    @photos = Photo.new({:name => "Add name"})
    @gallery = Gallery.order('position ASC')
    @counter = Photo.count + 1
  end

  def create
    @photos = Photo.new(photo_params)
    if @photos.save
      flash[:notice] = "Photo was successfully created"
      redirect_to(:action=>'index')
    else
      @counter = Photo.count + 1
      @gallery = Gallery.order('position ASC')
      render('new')
    end
  end

  def edit
    @photos = Photo.find(params[:id])
    @gallery = Gallery.order('position ASC')
    @counter = Photo.count
  end

  def update
    @photos = Photo.find(params[:id])
    if @photos.update_attributes(photo_params)
       flash[:notice] = "Photo was successfully updated"
      redirect_to(:action=>'show', :id => @photo.sid)
    else
      @counter = Photo.count
      @gallery = Gallery.order('position ASC')
      render('edit')
    end
  end

  def show
    @photos = Photo.find(params[:id])
  end

  def delete
    @photos = Photo.find(params[:id])
  end

  def sakujo_suru
    photos = Photo.find(params[:id]).destroy
     flash[:notice] = "Photo '#{photos.name}' was successfully deleted"
    redirect_to(:action=>'index')
  end

  def photo_params
     params.require(:photos).permit(:name, :position, :visibility, :description, :gallery_id, :created_at, :photo)
  end
end
