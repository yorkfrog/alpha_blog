class ArticlesController < ApplicationController
  
  def index
    @articles = Article.all
    
  end
  
  
  def new
    @article = Article.new
  end
  
  def edit 
    @article = Article.find(params[:id])
  end
  
  def  create
    @article = Article.new(article_params)
    
    if @article.save
      flash[:notice] = "article was successfuilly created"      
      redirect_to article_path(@article)
    else
      render 'new'  
    end
   # render plain: params[:article].inspect  
    
  end
  
  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "article was successfuilly updated"      
      redirect_to article_path(@article)
    else
      render 'edit'  
    end
    
    
    
  end
    
  def show
    @article = Article.find(params[:id])
  end
  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:notice] = "article was successfuilly deleted"
    redirect_to articles_path
  end
  
  private
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
