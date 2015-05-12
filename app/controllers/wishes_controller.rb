
class WishesController < ApplicationController
  before_action :set_wish, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  respond_to :html

  def index

      @wishes = Wish.where( :user => current_user.id)
      @current_user = current_user
      respond_with(@wishes)
  end

  def show
    
    respond_with(@wish)
  end

  def new
    @wish = Wish.new
    respond_with(@wish)
  end

  def edit
  end

  def create
    @current_user = params[:user_id] 
    @wish = Wish.new
    @wish.user = User.find(params[:user_id])
    @wish.book = Book.find(params[:book_id])
    
     respond_to do |format|
      if @wish.save
       
        format.html { redirect_to books_path, notice: 'Book added to your wish list' }
      else
        format.html { redirect_to books_path, alert: 'Book already in your wish list' }
      end
  end
    
    
  
    
  end

  def update
    @wish.update(wish_params)
    respond_with(@wish)
  end

  def destroy
    @wish.destroy
    redirect_to wishes_path
  end

  private
    def set_wish
      @wish = Wish.find(params[:id])
    end

    def wish_params
      params.require(:wish).permit(:user_id, :book_id)
    end
end
