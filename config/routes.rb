Rails.application.routes.draw do
  get '/report' => "user#report"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => "user#login_form"

  post "/login" => "user#login"

  get "/new" => "user#new"

  get "/set" => "user#set"

  post "/user/create" => "user#create"

  post "/logout" => "user#logout"

  post "user/re_set" => "user#re_set"

  post "/user/send_report" => "user#send_report"

end
