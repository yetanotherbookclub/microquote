require 'sinatra/base'
require 'sinatra/activerecord'

require_relative 'quote'

class App < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :database, adapter: 'sqlite3', database: 'microquote.sqlite3'

  get '/' do
    id = Quote.pluck(:id).sample
    id ? Quote.find(id).to_json : 404
  end

  post '/' do
    quote = Quote.create(
      :author => params[:author],
      :quote  => params[:quote]
    )
    quote.persisted? ? quote.to_json : 422
  end
end
