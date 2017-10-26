class ArticlesController < ApplicationController
  
  before_action :set_article_from_id, only: [:show, :edit, :update, :destroy]
  
  def index
    @articles = Article.all
    
  end
  
  def new
    @article = Article.new
  end
  
  def edit 
  end
  
  def  create
    @article = Article.new(article_params)
    
    if @article.save
      flash[:notice] = "article was successfully created"      
      redirect_to article_path(@article)
    else
      render 'new'  
    end
   # render plain: params[:article].inspect  
    
  end
  
  def update
    if @article.update(article_params)
      flash[:notice] = "article was successfully updated"      
      redirect_to article_path(@article)
    else
      render 'edit'  
    end
  end
    
  def show
  end
  
  def destroy
    @article.destroy
    flash[:notice] = "article was successfully deleted"
    redirect_to articles_path
  end
  
  private
  
    def set_article_from_id
      @article = Article.find(params[:id])
    end
  
    def article_params
      params.require(:article).permit(:title, :description)
    end
    
    
    
# def create

# @article = Article.new(article_params)

# @article.save

# redirect_to article_path(@article)

# end

# private

# def article_params

# params.require(:article).permit(:title, :description)

# end    
end
