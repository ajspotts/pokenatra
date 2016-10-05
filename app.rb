require 'pg'
require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

require_relative 'db/connection'
require_relative 'models/pokemon'



get '/pokemon' do
  @pokemons = Pokemon.all
  erb :"pokemon/index"
end

get '/pokemon/new' do
  erb :"pokemon/new"
end

get '/pokemon/:id' do
  @pokemons = Pokemon.find(params[:id])
  erb :"pokemon/show"
end

post '/pokemon' do
  @pokemons = Pokemon.create(params[:pokemon])
  redirect "/pokemon/#{@pokemons.id}"
end

get '/pokemon/:id/edit' do
  @pokemons = Pokemon.find(params[:id])
  erb :"pokemon/edit"
end

put '/pokemon/:id' do
  @pokemons = Pokemon.find(params[:id])
  @pokemons.update(params[:pokemon])
  redirect "/pokemon/#{@pokemons.id}"
end

delete '/pokemon/:id' do
 @pokemons=Pokemon.find(params[:id])
 @pokemons.destroy
 redirect '/pokemon'
end
