class ShelvesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @shelves = Shelf.all
  end

  def show
    @shelf = Shelf.find(params[:id])
  end

  def new
    @shelf = Shelf.new
  end

  def create
    @shelf = Shelf.new(shelf_params)
    @shelf.user_id = current_user.id
    if @shelf.save
      redirect_to shelf_path(@shelf), notice: 'success'
    else
      render :new
    end
  end

  def edit
    @shelf = Shelf.find(params[:id])
    if @shelf.user != current_user
      redirect_to shelves_path, alert: '不正なアクセスを検知しました'
    end
  end

  def update
    @shelf = Shelf.find(params[:id])
    if @shelf.update(shelf_params)
      redirect_to shelf_path(@shelf), notice: 'success'
    else
      render :edit
    end
  end

  def destroy
    shelf = Shelf.find(params[:id])
    shelf.destroy
    redirect_to shelves_path
  end

  private
  def shelf_params
    params.require(:shelf).permit(:title, :body, :image)
  end

end
