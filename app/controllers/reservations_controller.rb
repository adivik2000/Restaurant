class ReservationsController < ApplicationController
  def new

    @reservation = @site.reservations.new
  end
  
  def create
    @reservation = @site.reservations.new(params[:reservation])
      if @reservation.save
        #ReservationMailer.deliver_confirmation(@reservation)
        Contactmailer.deliver_reservation_customer_confirmation(@reservation)
        Contactmailer.deliver_reservation_info(@reservation)        
        flash[:success] = "Thank you for your reservation!"
      redirect_to :controller => 'reservations', :action => 'new'
      else
       render root_path
      end
  end


end
