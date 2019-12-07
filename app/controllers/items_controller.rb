class ItemsController < ApplicationController
  before_action :set_item, only: [:show]

  def index
    @items = Item.where(category: 1..199).order("created_at DESC").limit(10)
    @vuitton = Item.where(brand: "louis vuitton").order("created_at DESC").limit(10)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
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
    @root = @item.category.root.name
    @parent = @item.category.parent.name
    @children = @item.category.name
    # @price = @item.price.to_s.reverse.gsub( /(\d{3})(?=\d)/, '\1,').reverse （プライスの表示の仕方その２）
  end

  def purchase
    @item = Item.find(params[:id]) 
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :category_id, :size, :brand, :condition, :postage, :delivery_method, :from_prefecture, :delivery_days, :price, images: [])     # .merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
