require 'sinatra/base'
require './app/models/link'
require 'data_mapper'
require './app/data_mapper_setup'

class BookmarkManager < Sinatra::Base

  set :views, proc { File.join(root, '..', 'views') }
  # GIVES THE CONTROLLER FILE ACCESS TO THE VIEWS FOLDER WITH ALL ERB FILES IN IT.

  get '/' do
    'Hello BookmarkManager!'
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  post '/links' do
    link = Link.new(url: params[:url], title: params[:title])
    tag = Tag.create(name: params[:tag])
    link.tags << tag
    link.save
    #THIS MAKES NEW ENTRIES VIA THE MODEL. LINK.SAVE MAKES THE ENTRY GO IN.
    #LINKS.TAGS << TAG DESCRIBES THE RELATIONSHIP BETWEEN THE TABLES.
    redirect to ('/links')
  end

  get '/links/new' do
    erb :'links/new'
  end

  get '/tags/:name' do #:NAME MAKES IT CONNECT TO WHAT USER ENTERS IN NAME FIELD. USE OF PARAMETER IN THE ROUTE.
    tag = Tag.first(name: params[:name]) #WHAT IS .FIRST REFERRING TO? WHY IS IT THE FIRST ONE?
    @links = tag ? tag.links : []
    #  ^^If the tag exists, we get associated links. Otherwise, we just return an empty array.
    # NB TAG.LINKS HERE, NOT LINK.TAGS.
    erb :'links/index'
  end



  # start the server if ruby file executed directly
  run! if app_file == $0
end
