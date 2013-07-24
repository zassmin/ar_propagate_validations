get '/' do
  @events = Event.all
  erb :index
end

get '/events/:id/show' do |id|
  @event = Event.find(id)
  erb :event_show
end

get '/events/new' do
  @event = Event.new
  @errors = []

  erb :event_new
end

post '/events/create' do
  params[:event][:date].gsub!(/(\d{2}).+(\d{2}).+(\d{4})/, "\\3-\\1-\\2")
  @event = Event.create(params[:event]) 
  if @event.valid?
    redirect '/'
  else 
    @errors = @event.errors.full_messages
    erb :event_new
  end
end
