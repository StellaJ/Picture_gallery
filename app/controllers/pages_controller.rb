class PagesController < ApplicationController

  layout 'admin'

  def index
    @pages = Page.sort
  end

  def new
    @pages = Page.new(:name => "Name of the page:")
    @category = Category.order('position ASC')
    @counter = Page.count + 1
  end

  def create
    @pages = Page.new(page_params)
    if @pages.save
      flash[:notice] = "Page was successfully created"
      redirect_to(:action=>'index')
    else
      @counter = Page.count + 1
      @category = Category.order('position ASC')
      render('new')
    end
  end

  def edit
    @pages = Page.find(params[:id])
    @category = Category.order('position ASC')
    @counter = Page.count
  end

  def update
    @pages = Page.find(params[:id])
    if @pages.update_attributes(page_params)
       flash[:notice] = "Page was successfully updated"
      redirect_to(:action=>'show', :id => @pages.id)
    else
      @counter = Page.count
      @category = Category.order('position ASC')
      render('edit')
    end
  end

  def show
    @pages = Page.find(params[:id])
  end

  def delete
    @pages = Page.find(params[:id])
  end

  def sakujo_suru
    pages = Page.find(params[:id]).destroy
     flash[:notice] = "Page '#{pages.name}' was successfully deleted"
    redirect_to(:action=>'index')
  end

  def page_params
    params.require(:pages).permit(:name, :position, :visibility, :created_at, :category_id)
  end
end
