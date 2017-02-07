require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
  end

  get '/' do

  end

  get '/post' do
    @name = session[:deleted]
    erb :deleted
  end

  get '/posts' do
    erb :index
  end

  get '/posts/new' do
    erb :new
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end

  post '/posts' do
    post = Post.create(name: params[:name], content: params[:content])
    redirect to "/posts"
  end

  patch '/posts/:id' do
    post = Post.find(params[:id])
    post.update({name: params[:name], content: params[:content]})
    redirect to "/posts/#{post.id}"
  end

  delete '/posts/:id/delete' do
    post = Post.find(params[:id])
    session[:deleted] = post.name
    post.delete
    redirect to "/post"
  end
end
