class PhotosController < ApplicationController

	def destroy
        
        @photo = Photo.find(params[:id])
		
        if current_user.id == @photo.item.user.id || current_user.id == 7
            
            item = @photo.item

            @photo.destroy
            @photos = Photo.where(item_id: item.id)

		    respond_to :js
        else
            redirect_to root_path, notice: "Unauthorized access"
        end
	end
end