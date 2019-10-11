
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles/new' do

    erb :new
  end

  get '/articles/:id' do
    @article = Article.find_by(id: params[:id])
    erb :show
  end

  get '/articles' do
    @articles = Article.all

    erb :index
  end

  post '/articles' do
    new_article = Article.create(:title => params[:title], :content => params[:content])
    new_article.save
    redirect "/articles/#{new_article.id}"
  end

  get '/articles/:id/edit' do
    @article = Article.find_by(id: params[:id])

    erb :edit
  end

  patch '/articles/:id' do
    article = Article.find_by(id: params[:id])
    article.title = params[:title]
    article.content = params[:content]
    article.save

    redirect "/articles/#{params[:id]}"
  end

  delete '/articles/:id'
end
