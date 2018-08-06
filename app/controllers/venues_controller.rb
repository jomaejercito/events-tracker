class VenuesController < ApplicationController

  get '/venues' do
    if logged_in?
      @user = User.find_by_id(session[:user_id])
      erb :'/venues/venues'
    else
      redirect to '/login'
    end
  end

  get '/venues/new' do
    if logged_in?
      erb :"venues/new"
    else
      redirect to '/login'
    end
  end

  post '/venues' do
    if params[:name].empty?
      redirect to '/venues/new'
    else
      @user = User.find_by_id(session[:user_id])
      @venue = Venue.create(params)
      @user.venues << @venue
      redirect to "/venues/#{@user.username}"
    end
  end

  get '/venues/:username' do
    @user = User.find_by(username: params[:username])
    @venues = @user.venues
    if logged_in? && current_user == @user
      erb :"venues/show"
    else
      redirect to '/login'
    end
  end

  get '/venues/:username/:venue_id' do
    @user = User.find_by(username: params[:username])
    @venue = Venue.find_by_id(params[:venue_id])
    erb :"venues/index"
  end

end
