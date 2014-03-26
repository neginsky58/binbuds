class ItemsController < ApplicationController
  
  def index
    @items = Item.all
  end
  
  def new
    @item = Item.new
    @photo = Photo.new
  end
  
  def create
    @item = Item.new(item_params)
    @item[:user_id] = current_user.id
    if @item.save
      if params[:thumb_photo_id_1].to_i >0        
        photo = Photo.find(params[:thumb_photo_id_1].to_i)
        photo.update_attribute(:item_id, @item.id)
      end
      if params[:thumb_photo_id_2].to_i >0        
        photo = Photo.find(params[:thumb_photo_id_2].to_i)
        photo.update_attribute(:item_id, @item.id)
      end
      if params[:thumb_photo_id_3].to_i >0        
        photo = Photo.find(params[:thumb_photo_id_3].to_i)
        photo.update_attribute(:item_id, @item.id)
      end
      if params[:thumb_photo_id_4].to_i >0        
        photo = Photo.find(params[:thumb_photo_id_4].to_i)
        photo.update_attribute(:item_id, @item.id)
      end

      redirect_to action: 'index'
    else
      redirect_to action: 'new'
    end
  end

  def edit
    @item = Item.find(params[:id])    
  end
  
  def update
    @item = Item.find(params[:id])
    if @item.update_attribute(item_params) 
      redirect_to action: 'index'
    else
      redirect_to action: 'edit'
    end
  end

  def destroy    
    @item = Item.find(params[:id])
    if @item 
      @item.destroy
    end
    redirect_to action: 'index'    
  end

  private
  def item_params
    params.require(:item).permit(:name, :desc, :price, :is_negotiable, :condition_id, :category_id, :person_type_id, :size_id, :link)
  end

end
