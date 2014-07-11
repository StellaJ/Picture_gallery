class CategoriesController < ApplicationController

  layout false

  def index
    @categories = Category.sort
  end

  def new
    @category = Category.new(:name => "Name of the category:")
    @counter = Category.count + 1
  end

  def create
    @categories = Category.new(category_params)
    if @categories.save
      redirect_to(:action=>'index')
    else
      @counter = Category.count + 1
      render('new')
    end
  end

  def show
  end

  def edit
  end

  def delete
  end

  def category_params
    params.require(:category).permit(:name, :position, :visibility)
  end
end
