require 'rails_helper'

# Status: Passed

describe QuestionsController do
  it "routes /questions/ans_key to the answer key." do
    expect(:get => "/questions/ans_key").to route_to(:controller => "questions", :action => "ans_key")
  end
  it "routes /questions/:id to question profile." do
  	expect(:get => "/questions/1").to route_to(:controller => "questions", :action => "show", :id => "1")
  end
  it "routes /questions/:id/edit to the edit question page." do 
  	expect(:get => "/questions/1/edit").to route_to(:controller => "questions", :action => "edit", :id => "1")
  end
  it "routes /questions/:id to update the query when method is PATCH." do
  	expect(:patch => "/questions/1").to route_to(:controller => "questions", :action => "update", :id => "1")
  end
  it "routes /questions/:id to delete the query when method is DELETE." do
  	expect(:delete => "/questions/1").to route_to(:controller => "questions", :action => "destroy", :id => "1")
  end 
end