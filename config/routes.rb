Rails.application.routes.draw do
 
  devise_for :users

  root to: "fridges#index"

  # Routes for the FoodItem resource:

  # CREATE
  post("/insert_food_item", { :controller => "food_items", :action => "create" })

  # READ
  get("/food_items", { :controller => "food_items", :action => "index" })
  get("/food_items/:path_id", { :controller => "food_items", :action => "show" })

  # UPDATE
  post("/modify_food_item/:path_id", { :controller => "food_items", :action => "update" })

  # DELETE
  get("/delete_food_item/:path_id", { :controller => "food_items", :action => "destroy" })

  #------------------------------

  # Routes for the Fridge resource:

  # CREATE
  post("/insert_fridge", { :controller => "fridges", :action => "create" })

  # READ
  get("/fridges", { :controller => "fridges", :action => "index" })
  get("/fridges/:path_id", { :controller => "fridges", :action => "show" })

  # UPDATE
  post("/modify_fridge/:path_id", { :controller => "fridges", :action => "update" })

  # DELETE
  get("/delete_fridge/:path_id", { :controller => "fridges", :action => "destroy" })
end
