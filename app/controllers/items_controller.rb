class ItemsController < ApplicationController
  def create
    @item = Item.new(item_params)
    @item.user = current_user

    if @item.save
      flash[:notice] = 'Item has been added successfully.'
      redirect_to root_path
    else
      flash.now[:alert] = 'There was an error saving the item. Please try again.'
      render :new
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
       format.html
       format.js
    end
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
