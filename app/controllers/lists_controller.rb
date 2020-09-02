class ListsController < ApplicationController
  before_action :set_board
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def index
    @lists = @board.lists
  end

  def show
    # @list = @board.lists.find(@board_id)
  end

  def new
    @list = @board.lists.new
  end

  def create
    @list = @board.lists.new(list_params)
    if @list.save
      redirect_to [@board] #should be right?
    else
      render :new
    end
  end


  def edit

  end

  def update
    if @list.update(list_params)
      redirect_to [@board, @list]
    else
      render :edit
    end
  end 

  def destroy
    @list.destroy
    redirect_to board_lists_path

  end

  private
  
  def set_board
    @board = current_user.boards.find(params[:board_id])
  end

  def set_list
    @list = List.find(params[:id])
    # @list = current_user
  end

  def list_params
    params.require(:list).permit(:name, :board_id)
  end

end
