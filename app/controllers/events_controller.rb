class EventsController < ApplicationController

  get '/event/:venue_id/new' do
    if logged_in?
      @venue = Venue.find_by_id(params[:venue_id])
      erb :'event/new'
    else
      redirect to '/login'
    end
  end

  post '/event/:venue_id' do
    if params[:name].empty?
      @venue = Venue.find_by_id(params[:venue_id])
      redirect to "/event/#{@venue.id}/new"
    else
      @user = User.find_by_id(session[:user_id])
      @venue = Venue.find_by_id(params[:venue_id])
      @event = Event.create(name: params[:name], date: params[:date],time: params[:time])
      @venue.event << @event
      redirect to "/venues/#{@user.username}/#{@venue.id}"
    end
  end

end
