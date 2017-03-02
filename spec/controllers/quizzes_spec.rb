require 'rails_helper'

# Status: Passed

describe QuizzesController do
  it "routes / to the Quiz Master home page." do
  	expect(:get => "/").to route_to(:controller => "quizzes", :action => "index")
  end	
  it "routes /quizzes/new to new questions page." do
  	expect(:get => "/quizzes/new").to route_to(:controller => "quizzes", :action => "new")
  end
  it "routes /quizzes/question when a user posts a new question." do
  	expect(:post => "/quizzes/question").to route_to(:controller => "quizzes", :action => "create_query")
  end
  it "routes /quizzes/identification when user has chosen Identification type." do
  	expect(:get => "/quizzes/identification").to route_to(:controller => "quizzes", :action => "identify")
  end
  it "routes /quizzes/post_answer_id when user has provided answer for Identification type." do
  	expect(:post => "/quizzes/post_answer_id").to route_to(:controller => "quizzes", :action => "post_answer_id")
  end
  it "routes /quizzes/multiple_choice when user has chosen Multiple Choice type." do
  	expect(:get => "/quizzes/multiple_choice").to route_to(:controller => "quizzes", :action => "multiple_choice")
  end
  it "routes /quizzes/post_answer_mc when user has provided answer for Multiple Choice type." do
  	expect(:post => "/quizzes/post_answer_mc").to route_to(:controller => "quizzes", :action => "post_answer_mc")
  end
  it "routes /quizzes/true_false when user has chosen True or False type." do
  	expect(:get => "/quizzes/true_false").to route_to(:controller => "quizzes", :action => "true_false")
  end
  it "routes /quizzes/post_answer_tf when user has provided answer for True or False type." do
  	expect(:post => "/quizzes/post_answer_tf").to route_to(:controller => "quizzes", :action => "post_answer_tf")
  end
  it "routes /quizzes/begin when user wants to start the quiz." do
  	expect(:get => "/quizzes/begin").to route_to(:controller => "quizzes", :action => "begin")
  end
  it "routes /quizzes/give_ans when user has given his answer." do
  	expect(:get => "/quizzes/give_ans").to route_to(:controller => "quizzes", :action => "process_answer")
  end
  it "routes /quizzes/get_next when user moves on to the next question." do
  	expect(:get => "/quizzes/get_next").to route_to(:controller => "quizzes", :action => "next_question")
  end
  it "routes /quizzes/reset when user wants to redo the quiz." do
  	expect(:get => "/quizzes/reset").to route_to(:controller => "quizzes", :action => "reset")
  end
end


