class CategoriesController < ApplicationController

  layout 'admin'

   before_action :check_logon
   
  def index
    @categories = Category.sort
  end

  def new
    @categories = Category.new(:name => "Name of the category:")
    @counter = Category.count + 1
  end

  def create
    @categories = Category.new(category_params)
    if @categories.save
      flash[:notice] = "Category was successfully created"
      redirect_to(:action=>'index')
    else
      @counter = Category.count + 1
      render('new')
    end
  end

  def show
    @categories = Category.find(params[:id])
  end

  def edit
    @categories = Category.find(params[:id])
    @counter = Category.count
  end

  def update
    @categories = Category.find(params[:id])
    if @categories.update_attributes(category_params)
       flash[:notice] = "Category was successfully updated"
      redirect_to(:action=>'show', :id => @categories.id)
    else
      @counter = Category.count
      render('edit')
    end
  end

  def delete
    @categories = Category.find(params[:id])
  end

  def sakujo_suru
    categories = Category.find(params[:id]).destroy
     flash[:notice] = "Category was successfully deleted"
    redirect_to(:action=>'index')
  end

  def category_params
    params.require(:categories).permit(:name, :position, :visibility, :created_at)
  end
end
