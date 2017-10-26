class ArticlesController < ApplicationController
  
  def new
    @article = Article.new
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
    
  def show
    @article = Article.find(params[:id])
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
