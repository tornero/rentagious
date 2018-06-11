class ItemsController < ApplicationController
  
  before_action :set_item, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:show]
    
  def index
      @items = current_user.items
  end

  def show
      @photos = @item.photos
      
      @booked = Reservation.where("item_id = ? AND user_id = ?", @item.id, current_user.id).present? if current_user
      
      @reviews = @item.reviews
      @hasReview = @reviews.find_by(user_id: current_user.id) if current_user
  end

  def new
      @item = current_user.items.build
  end

  def create
      @item = current_user.items.build(item_params)
      
      if @item.save
          
          if params[:images]
              params[:images].each do |image|
                  @item.photos.create(image: image)
              end
          end
          
          @photos = @item.photos
          redirect_to items_path, notice: "Your listing has been successfully saved!"
      else
          flash[:alert] = "Please provide all required information for this item."
          render :new
      end
  end

  def edit
      if current_user.id == @item.user.id || current_user.id == 7
          @photos = @item.photos
      else
          redirect_to root_path, notice: "Unauthorized access"
      end
  end

  def update
      if @item.update(item_params)
          
          if params[:images]
              params[:images].each do |image|
                  @item.photos.create(image: image)
              end
          end
          
          redirect_to items_path, notice: "Your listing has been successfully updated!"
      else
          flash[:alert] = "Please provide all required information for this item."
          render :edit
      end
  end
    
  private
    def set_item
        @item = Item.find(params[:id])
    end
    def item_params
        params.require(:item).permit(:category, :subcategory, :listing_name, :summary, :address_street, :address_city, :address_state, :address_zip, :price, :deposit, :active)
    end
end
