require 'rails_helper'

# Status: Passed

describe "rendering the question on the multiple choice page for reference" do
  it "displays the question" do
  	assign(:recent_query, Question.create!(:question => "What is the tallest mountain on earth?", :exam => "id"))

  	render :template => "quizzes/multiple_choice.html.erb"

  	expect(rendered).to match /What is the tallest mountain on earth?/
  end
end