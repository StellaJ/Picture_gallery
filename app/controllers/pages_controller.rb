class PagesController < ApplicationController

  layout 'admin'

  def index
    @pages = Page.sort
  end

  def new
    @page = Page.new(:name => "Name of the page:")
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
    @page = Page.find(params[:id])
    @category = Category.order('position ASC')
    @counter = Page.count
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(page_params)
       flash[:notice] = "Page was successfully updated"
      redirect_to(:action=>'show', :id => @page.id)
    else
      @counter = Page.count
      @category = Category.order('position ASC')
      render('edit')
    end
  end

  def show
    @page = Page.find(params[:id])
  end

  def delete
    @page = Page.find(params[:id])
  end

  def sakujo_suru
    page = Page.find(params[:id]).destroy
     flash[:notice] = "Page '#{page.name}' was successfully deleted"
    redirect_to(:action=>'index')
  end

  def page_params
    params.require(:page).permit(:name, :position, :visibility, :created_at, :category_id)
  end
end
