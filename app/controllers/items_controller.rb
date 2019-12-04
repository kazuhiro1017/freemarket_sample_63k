class ItemsController < ApplicationController
  
  def index
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
    redirect_to root_path
  end

  def category_find
    respond_to do |format|
      parent = Category.find(params[:category_id])
      @children = parent.children
      format.json
    end
  end


  def purchase
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :category_id, :size, :brand, :condition, :postage, :delivery_method, :from_prefecture, :delivery_days, :price, images: [])     # .merge(user_id: current_user.id)
  end

end
