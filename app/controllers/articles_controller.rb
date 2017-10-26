class ArticlesController < ApplicationController
  
  def new
    @article = Article.new
  end
  
  def  create
    
    
    @article = Article.new(article_params)
    #@article = Article.new()
    @article.save
    render plain: params[:article].inspect  
   # redirect_to articles_show(@article)
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
