require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :welcome
  end

  post "/signup" do
		#your code here!
		# user = User.new(:username => params[:username], :password => params[:password])

    if user.save
      redirect "/login"
    else
      redirect "/failure"
    end
	end

  post "/login" do
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/success"
    else
      redirect "/failure"
    end
  end 

end


=begin
  
HTTP VERB    ROUTE	          Action	         Used For
GET	    '/articles'	          index action	  index page to display all articles
GET    	'/articles/new'       new action  	  displays create article form                        
POST	  '/articles'  	        create action	  creates one article
GET    	'/articles/:id'	      show action  	  displays one article based on ID in the url
GET	    '/articles/:id/edit'	edit action	    displays edit form based on ID in the url
PATCH	  '/articles/:id'	      update action	  modifies an existing article based on ID in the url
PUT	    '/articles/:id'	      update action	  replaces an existing article based on ID in the url
DELETE	'/articles/:id'	      delete action	  deletes one article based on ID in the url  
=end
