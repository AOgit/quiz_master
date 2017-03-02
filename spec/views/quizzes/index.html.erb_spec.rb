require 'rails_helper'

# Status: Passed

describe 'quizzes/index' do
  it "displays all the questions" do
  	assign(:questions, [
  	  Question.create!(:question => "What is the tallest mountain on earth?", :exam => "id"),
  	  Question.create!(:question => "Where is Mount Kilimajaro?", :exam => "id")
  	])

  	render 

  	expect(rendered).to match /What is the tallest mountain on earth?/
  	expect(rendered).to match /Where is Mount Kilimajaro?/
  end	
end