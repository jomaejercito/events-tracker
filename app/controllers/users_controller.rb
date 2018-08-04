class UsersController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect '/venues'
    end
    erb :'/users/signup'
  end

  post '/signup' do
    if params[:username].empty? || params[:email].empty? || params[:password].empty?
      redirect '/signup'
    elsif !params[:email].match /@/
      redirect '/signup'
    else
      @user = User.create(params)
      session[:user_id] = @user.id
      redirect '/users/index'
    end
  end

  get '/login' do
    if logged_in?
      redirect to '/users/index'
    else
      erb :'users/login'
    end
  end

  post '/login' do
    @user = User.find_by(:username => params[:username])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/venues'
    else
      redirect to '/login'
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

  get '/users/index' do
    if logged_in?
      @venues = Venue.all
      erb :'/users/index'
    else
      redirect to '/login'
    end
  end

  get "/users/:slug" do
    @user = User.find_by_slug(params[:slug])
    redirect :"/users/#{@user.slug}"
  end

end
