class Application
  get '/users' do
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

  get '/users/:id' do
    @user = User.first(:id => params[:id])
    haml :"users/show"
  end
end
