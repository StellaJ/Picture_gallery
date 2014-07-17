class ArticlesController < ApplicationController

  layout 'admin'
  
  def index
    @articles = Article.sort
  end
  
  def new
    @articles = Article.new({:name => "Title?"})
    @page = Page.order('position ASC')
    @counter = Article.count + 1
  end

  def create
    @articles = Article.new(article_params)
    if @articles.save
      flash[:notice] = "Article was successfully created"
      redirect_to(:action=>'index')
    else
      @counter = Article.count + 1
      @page = Page.order('position ASC')
      render('new')
    end
  end

  def edit
    @articles = Article.find(params[:id])
    @page = Page.order('position ASC')
    @counter = Article.count
  end

  def update
    @articles = Article.find(params[:id])
    if @articles.update_attributes(article_params)
       flash[:notice] = "Article was successfully updated"
      redirect_to(:action=>'show', :id => @articles.id)
    else
      @counter = Article.count
      @page = Page.order('position ASC')
      render('edit')
    end
  end

  def show
    @articles = Article.find(params[:id])
  end

  def delete
    @articles = Article.find(params[:id])
  end

  def sakujo_suru
    articles = Article.find(params[:id]).destroy
     flash[:notice] = "Article '#{articles.name}' was successfully deleted"
    redirect_to(:action=>'index')
  end

  def article_params
    params.require(:articles).permit(:name, :position, :visibility, :created_at, :page_id, :photo)
  end
end
