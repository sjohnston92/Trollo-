class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]

  def index
    @boards = current_user.boards
  end

  def show
  end

  def new
    @board = current_user.boards.new
  end

  def create
    @board = current_user.boards.new(board_params)
    if @board.save
      redirect_to root_path
    else
      render :new
    end
  end


  def edit
    render partial: "form"
  end

  def update

    if @board.update(board_params)
      redirect_to root_path
    else
      render :edit
    end
  end 

  def destroy
    @board.destroy
    redirect_to root_path
  end

  private
  
  def set_board
    @board = current_user.boards.find(params[:id])
  end

  def board_params
    params.require(:board).permit(:name)
  end

end
