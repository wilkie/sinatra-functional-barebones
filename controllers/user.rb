class Application
  get '/users' do
    current_user
    @users = User.all
    haml :"users/index"
  end

  post '/users' do
    user = User.create(params)
    redirect "/users/#{user.id}"
  end

  get '/users/new' do
    haml :"users/new"
  end

  get '/users/:id/edit' do
    @user = User.first(:id => params[:id])
    haml :"users/edit"
  end

  post '/users/:id/edit' do
    user = User.first(:id => params[:id])
    user.update_attributes!(params)
  end

  get '/users/:id' do
    @user = User.first(:id => params[:id])
    haml :"users/show"
  end
end
