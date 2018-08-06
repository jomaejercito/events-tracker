class VenuesController < ApplicationController

  get '/venues' do
    if logged_in?
      @venues = Venue.all
      erb :'/venues/venues'
    else
      redirect to '/login'
    end
  end

end
