post '/contact_request' do
  requester = User.find(session[:user_id])
  requestee = User.find(params[:contact_id])
  requestee.requests.create(requester: requester)
  redirect '/my_contacts'
end

post '/contact_request/approve' do
  request = Request.find(params[:request_id])
  request.share_contact
  redirect '/my_contacts'
end

delete '/contact_request/delete' do
  Request.find(params[:request_id]).destroy
  redirect '/my_contacts'
end
