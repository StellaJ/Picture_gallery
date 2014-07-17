class GalleriesController < ApplicationController

  layout 'admin'

  def index
    @galleries = Gallery.sort
  end

  def new
    @galleries = Gallery.new({:name => "Add name"})
    @counter = Gallery.count + 1
  end

  def create
    @galleries = Gallery.new(gallery_params)
    if @galleries.save
      flash[:notice] = "Gallery was successfully created"
      redirect_to(:action=>'index')
    else
      @counter = Gallery.count + 1
      render('new')
    end
  end

  def edit
    @galleries = Gallery.find(params[:id])
    @counter = Gallery.count
  end

  def update
    @galleries = Gallery.find(params[:id])
    if @galleries.update_attributes(gallery_params)
       flash[:notice] = "Gallery was successfully updated"
      redirect_to(:action=>'show', :id => @galleries.id)
    else
      @counter = Gallery.count
      render('edit')
    end
  end

  def show
    @galleries = Gallery.find(params[:id])
  end

  def delete
    @galleries = Gallery.find(params[:id])
  end

  def sakujo_suru
    galleries = Gallery.find(params[:id]).destroy
     flash[:notice] = "Gallery '#{galleries.name}' was successfully deleted"
    redirect_to(:action=>'index')
  end

  def gallery_params
     params.require(:galleries).permit(:name, :position, :visibility, :description, :photo)
  end
end
