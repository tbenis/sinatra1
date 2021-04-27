class ClubController < ApplicationController


    #index action
    get '/clubs' do
        @clubs = club.all
        erb :index
    end 

    #new action
    get '/clubs/new' do
        erb :new
    end
      
    post '/clubs' do
        @club = Club.create(:title => params[:title], :content => params[:content])
        redirect to "/clubs/#{@club.id}"
    end 

    #show action
    get '/clubs/:id' do
        @club = Club.find_by_id(params[:id])
        erb :show
    end 

    #edit action
    get '/clubs/:id/edit' do  #load edit form
        @club = Club.find_by_id(params[:id])
        erb :edit
    end
    
    patch '/clubs/:id' do #edit action
      @club = Club.find_by_id(params[:id])
      @club.title = params[:title]
      @club.content = params[:content]
      @club.save
      redirect to "/clubs/#{@club.id}"
    end 

    delete '/clubs/:id' do #delete action
        @club = Club.find_by_id(params[:id])
        @club.delete
        redirect to '/clubs'
      end 
end