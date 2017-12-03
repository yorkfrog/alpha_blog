class ArticlesController < ApplicationController
  
  before_action :set_article_from_id, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  
  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)
    
  end
  
  def new
    @article = Article.new
  end
  
  def edit 
  end
  
  def  create
    @article = Article.new(article_params)

    # hardcode user for dev. until we get authentication working
    @article.user = current_user
    if @article.save
      flash[:success] = "article was successfully created"      
      redirect_to article_path(@article)
    else
      render 'new'  
    end
   # render plain: params[:article].inspect  
    
  end
  
  def update
    if @article.update(article_params)
      flash[:success] = "article was successfully updated"      
      redirect_to article_path(@article)
    else
      render 'edit'  
    end
  end
    
  def show
  end
  
  def destroy
    @article.destroy
    flash[:danger] = "article was successfully deleted"
    redirect_to articles_path
  end
  
  private
  
    def set_article_from_id
      @article = Article.find(params[:id])
    end
  
    def article_params
      params.require(:article).permit(:title, :description)
    end
  
    def require_same_user 
      if current_user != @article.user
        flash[:danger] = "You can only edit or delete your own articles."
        redirect_to root_path
      end
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
