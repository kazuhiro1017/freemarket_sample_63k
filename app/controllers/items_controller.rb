class ItemsController < ApplicationController
  
  def index
    @items = Item.where(category: 1..199).order("created_at DESC").limit(10)
    @vuitton = Item.where(brand: "louis vuitton").order("created_at DESC").limit(10)
  end

  def new
    @item = Item.new
  end


  def create
    @item = Item.new(item_params)
    if @item.images.attached?
      @item.save
      redirect_to root_path
    else
      flash.now[:alert] = "[必須]を入力してください。"
      render "new"
    end
  end

  def category_find
    respond_to do |format|
      parent = Category.find(params[:category_id])
      @children = parent.children
      format.json
    end
  end

  def show
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @update_item = @item.update(item_params)
    if @update_item.images.attached?
      @update_item.save
      redirect_to root_path
    else
      flash.now[:alert] = "[必須]を入力してください。"
      render "edit"
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to root_path
  end

  def purchase
    @item = Item.find(params[:id]) 
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :category_id, :size, :brand, :condition, :postage, :delivery_method, :from_prefecture, :delivery_days, :price, images: []).merge(user_id: session[:user_id])
  end

end
