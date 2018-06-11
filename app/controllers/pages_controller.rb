class PagesController < ApplicationController
  
  def home
      @items = Item.where(active: true).limit(15)
  end
    
  def waiver
     @user = User.new 
  end
    

  def search
      
      if params[:search].present? && params[:search].strip != ""
          session[:loc_search] = params[:search]
      end
      
      arrResult = Array.new
      
      if session[:loc_search] && session[:loc_search].strip != ""
          @items_address = Item.where(active: true).near(session[:loc_search], 5, order: 'distance')
      else
           @items_address = Item.where(active: true).all
      end
      
      @search = @items_address.ransack(params[:q])
      puts params[:q]
      @items = @search.result
      
      @arrItems = @items.to_a
      
      if (params[:start_date] && params[:end_date] && !params[:start_date].empty? && !params[:end_date].empty?)
          
          start_date = Date.strptime(params[:start_date], '%m-%d-%Y')
          end_date = Date.strptime(params[:end_date], '%m-%d-%Y')
          
          @items.each do |item|
          
            not_available = item.reservations.where(
                  "(? <= start_date AND start_date <= ?)
                    OR (? <= end_date AND end_date <= ?)
                    OR (start_date < ? AND ? < end_date)",
                    start_date, end_date,
                    start_date, end_date,
                    start_date, end_date
              ).limit(1)
             
            if not_available.length > 0
                @arrItems.delete(item)
            end
          end
          
      end
      
  end
    
end
