class ReservationsController < ApplicationController
	before_action :authenticate_user!, except: [:notify]

    def preload
		item = Item.find(params[:item_id])
		today = Date.today
		reservations = item.reservations.where("start_date >= ? OR end_date >= ?", today, today)
        
		render json: reservations	
	end
    
    def preview
       start_date = Date.parse(params[:start_date])
       end_date = Date.parse(params[:end_date])
       
        output = {
            conflict: is_conflict(start_date, end_date)
        }
        
        render json: output
    end
    
	def create
		filtered_reservation_params = reservation_params
        filtered_reservation_params[:start_date] = DateTime.strptime(filtered_reservation_params[:start_date], '%m/%d/%Y')
        filtered_reservation_params[:end_date] = DateTime.strptime(filtered_reservation_params[:end_date], '%m/%d/%Y')
        @reservation = current_user.reservations.create(filtered_reservation_params)
        
        @reservation.update_attributes status: true #remove from here and only leave below if adding PayPal back
        
        
        if @reservation && @reservation.item.active == true
            # send confirmation/notification emails to borrower & lender
            ReservationMailer.reservation_confirmation_email(@reservation).deliver
            ReservationMailer.reservation_notification_email(@reservation).deliver
            
            ### send request to PayPal
            # values = {
            #     business: 'azturner1014-facilitator@gmail.com',
            #     cmd: '_xclick',
            #     upload: 1,
            #     notify_url: 'http://5378fd4d.ngrok.io/notify',
            #     amount: @reservation.total,
            #     item_name: @reservation.item.listing_name,
            #     item_number: @reservation.id,
            #     quantity: '1',
            #     return: 'http://5378fd4d.ngrok.io/your_rental_history'
            # }
            
            # redirect_to "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
        else
            return @reservation.item, alert: "Oops, something went wrong..."
        end
        
        # to launch ngrok server:
        # from terminal > $cd "C:\Users\Adam Turner\iCloudDrive\Rentagious"
        # then > $ngrok http 3000
        # then update ngrok references above
        
		redirect_to @reservation.item, notice: "You have succesfully booked this item!"
	end
    
    protect_from_forgery except: [:notify]
    def notify
        params.permit!
        status = params[:payment_status]
        
        reservation = Reservation.find(params[:item_number])
        
        if status == "Completed"
            reservation.update_attributes status: true
        else
            reservation.destroy
        end
        
        render nothing: true
    end
    
    protect_from_forgery except: [:your_rental_history]
    def your_rental_history
		@rentals = current_user.reservations.sort.reverse#.where("status = ?", true)
	end
    
    def your_reservations
        @items = current_user.items
    end

    def destroy
        
		@reservation = Reservation.find(params[:id])
        puts Date.current
        if @reservation.start_date.to_date > Date.current
            item = @reservation.item

            ReservationMailer.reservation_cancellation_confirmation_email(@reservation).deliver
            ReservationMailer.reservation_cancellation_notification_email(@reservation).deliver

            @reservation.destroy
            
            redirect_to your_rental_history_path, notice: "Reservation cancelled successfully."
        
        else
            
            redirect_to your_rental_history_path, alert: "It is too close to your reservation start date. If you need to modify your reservation, please reach out to the owner directly."
            
        end
		
	end
    
	private
        def 
            is_conflict(start_date, end_date)
            item = Item.find(params[:item_id])
            
            check = item.reservations.where("? < start_date AND end_date < ?", start_date, end_date)
            check.size > 0? true : false
        end
    
		def reservation_params
			params.require(:reservation).permit(:item_id, :start_date, :end_date, :price, :total)
		end
end