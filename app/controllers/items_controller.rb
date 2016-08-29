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
    @item = current_user.items.find(params[:id])
    @item.destroy
    
    if @item.destroy
      flash[:notice] = "\"#{@item.name}\" has been completed!"
      redirect_to root_path
    else
      flash.now[:alert] = 'There was an error deleting the item.'
      render :show
    end
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
