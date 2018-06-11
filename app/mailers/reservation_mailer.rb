class ReservationMailer < ActionMailer::Base
  default from: "Rentagious.com"
    
  def reservation_confirmation_email(reservation)
    @reservation = reservation
    @url = 'http://www.rentagious.com/your_rental_history'
    mail(to: @reservation.user.email, subject: 'You just booked an item on Rentagious.com!')
  end
    
  def reservation_notification_email(reservation)
    @reservation = reservation
    @url = 'http://www.rentagious.com/your_reservations'
    mail(to: @reservation.item.user.email, subject: 'Your item was just booked on Rentagious.com!')
  end
    
  def reservation_cancellation_notification_email(reservation)
    @reservation = reservation
    @url = 'http://www.rentagious.com/your_reservations'
    mail(to: @reservation.item.user.email, subject: 'Cancelled Reservation on Rentagious.com!')
  end
 
  def reservation_cancellation_confirmation_email(reservation)
    @reservation = reservation
    @url = 'http://www.rentagious.com/your_rental_history'
    mail(to: @reservation.user.email, subject: 'Cancelled Reservation on Rentagious.com!')
  end
    
end
