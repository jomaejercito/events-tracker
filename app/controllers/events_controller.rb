class EventsController < ApplicationController

  get '/event/:venue_id/new' do
    if logged_in?
      @venue = Venue.find_by_id(params[:venue_id])
      erb :'events/new'
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

  get '/event/:venue_id/:event_id/edit' do
    @venue = Venue.find_by_id(params[:venue_id])
    @event = Event.find_by_id(params[:event_id])
    erb :'event/edit'
  end

  patch '/event/:venue_id/:event_id' do
    @user = User.find_by_id(session[:user_id])
    @venue = Venue.find_by_id(params[:venue_id])
    @event = Event.find_by_id(params[:event_id])
    @event.update(name: params[:name], date: params[:date],time: params[:time])
    redirect to "/venues/#{@user.username}/#{@venue.id}"
  end

  delete '/event/:venue_id/:event_id/delete' do
    @user = User.find_by_id(session[:user_id])
    @venue = Venue.find_by_id(params[:venue_id])
    @event = Event.find_by_id(params[:event_id])
    @event.delete
    redirect to "/venues/#{@user.username}/#{@venue.id}"
  end

end
