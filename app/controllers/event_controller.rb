MyApp.get "/events" do
	@list_events = Event.all
  erb :"events/list_events"
end

MyApp.get "/events/add_new" do
  erb :"events/add_event"
end

MyApp.post "/add_event" do
	x = Event.new
	x.name = params[:name]
	x.save
  erb :"success"
end

MyApp.get "/event_info/:event_id" do
  @event = Event.find(params[:event_id])
  @list_competitors = Competitor.all
  erb :"events/event_info"
end

MyApp.post "/add_entry/:event_id" do
	x = Result.new
	x.event_id = params[:event_id]
	x.competitor_id = params[:competitor_id]
	x.save
  erb :"success"
end

MyApp.get "/events/edit/:event_id" do
  	@event = Event.find(params[:event_id])
	erb :"events/edit_event"
end

MyApp.post "/edit_event/:event_id" do
	@event = Event.find(params[:event_id])
	@event.update_attributes({name: params['name']})
	@event.save
	erb :"success"
end

MyApp.post "/event_delete/:event_id" do
	@event = Event.find(params[:event_id])
	@event.delete_result_info
	@event.delete
	erb :"success"
end
