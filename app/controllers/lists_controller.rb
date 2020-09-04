class ListsController < ApplicationController
  # before_action :set_board, only: [:index]
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def index
    @board = current_user.boards.find(params[:board_id])
    @lists = @board.lists
  end

  def show

  end

  def new
    @list = @board.lists.new
  end

  def create
    @list = @board.lists.new(list_params)
    if @list.save
      redirect_to [@board]
    else
      render :new
    end
  end


  def edit
    render partial: "lists/form"
  end

  def update
    if @list.update(list_params)
      redirect_to [@board]
    else
      render :edit
    end
  end 

  def destroy
    @list.destroy
    redirect_to board_lists_path

  end

  private
  


  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end


end
