class LoansController < ApplicationController
  before_action :set_loan, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  respond_to :html

  def index
    @current_user = current_user
    if @current_user.role == 'reader'
      @loans = Loan.where(@loan.user => @current_user.id)
    else
    @loans = Loan.all
  end
    
    respond_with(@loans)
  end

  def show
    respond_with(@loan)
  end

  def new
    
    @books = Book.all
    @loan = Loan.new
    @users = User.where(:role => "reader")
    
    
  end

  def edit
  end

  def create
    @wloan = Loan.new(loan_params)
=begin
@loan.user = User.find(params[:user_id])
    @wish.book = Book.find(params[:book_id])
    @loan.physical = params[:physical]
    @loan.loandate = params[:loandate]
    @loan.loanreturn = params[:loanreturn]
    @loan.save
=end
  end

  def update
    @loan.update(loan_params)
    respond_with(@loan)
  end

  def destroy
    @loan.destroy
    respond_with(@loan)
  end

  private
    def set_loan
      @loan = Loan.find(params[:id])
    end

    def loan_params
      params.require(:loan).permit(:user_id, :book_id, :physical, :loandate , :loanreturn)
    end
end
