Rails.application.routes.draw do
  get("/", { :controller => "places", :action => "index" })
  resources "entries"
  resources "places"
  resources "sessions"
  
  resources "users", only: [:new, :create]
  get("/login", { :controller => "sessions", :action => "new" })
  post("/sessions", { :controller => "sessions", :action => "create" })
  get("/logout", { :controller => "sessions", :action => "destroy" })
end
