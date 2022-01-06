class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end

  get "/jobs" do
    Job.all.to_json
  end

  get "/jobs/:id" do
    job = Job.find(params[:id])

    job.to_json(include: :users)
  end
  

  get "/companies" do
    Company.all.to_json
  
  end

  get '/users' do
    User.all.to_json
  end

  get '/users/:id' do
    user = User.find(params[:id])
    
    # should include associated jobs in the Json response
    user.to_json(include: :jobs)
  end

  get '/applies' do
    Apply.all.to_json
  end

  get '/resumes' do
    
    Resume.all.to_json
  
  end

  get '/coverletters' do
    CoverLetter.all.to_json
  end



# POST reqs

post '/applies' do
  apply = Apply.create(
     user_id: params[:user_id],
     job_id: params[:job_id]
  ) 
     apply.to_json
     puts "does this  work?"
end

post '/users' do
  user = User.create(
  name: params[:name],
  address: params[:address],
  email: params[:email],
  phone_number: params[:phone_number]
) 
  puts "does this  work?"
end

#DELETE req
# delete 'applies/:id' do
# 	apply = apply.find(params[:id])
# 	review.destroy
# 	review.to_json
# end

#PATCH req
patch '/applies/:id' do
  apply = Apply.find(params[:id])
  apply.update(
    user_id: params[:user_id],
    job_id: params[:job_id]
  )
  review.to_json
end

patch '/resumes/:id' do
  resume = R.sumefind(params[:id])
  resume.update(
    name: params[:name],
    address: params[:address],
    email: params[:email],
    phone_number: params[:phone_number]

  #  user_id #is this needed here?
  )
  review.to_json
end

patch '/cover_letters/:id' do
  coverLetters = CoverLetter.find(params[:id])
  coverLetters.update(
    name: params[:name],
    company: params[:company]

    #user_id #is this needed here?
  )
  review.to_json
end

end