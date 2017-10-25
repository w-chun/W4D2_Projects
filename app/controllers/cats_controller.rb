class CatsController < ApplicationController
  def update
    @cat = Cat.find(params[:id])

    if @cat.update(cat_params)
      @cats = Cat.all
      render :index
    else
      render :edit
    end
  end

  def edit
    @cat = Cat.find(params[:id])
    render :edit
  end

  def new
    @cat=Cat.new
    render :new
    # redner :new
  end

  def create
    # render json: params
    cat = Cat.create(cat_params)
    render json: cat
  end

  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = Cat.find(params[:id])
    render :show
  end

private

  def cat_params
    params.require(:cat).permit(:name, :color, :sex, :description, :birth_date)
  end
end
