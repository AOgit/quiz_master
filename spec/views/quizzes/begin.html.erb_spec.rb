require 'rails_helper'

# Status: Passed

describe "rendering the question on the quiz page and answer after attempt" do
  it "displays the question and answer" do
  	assign(:question, Question.create!(:question => "What is the tallest mountain on earth?", :exam => "id"))
  	assign(:answer, Answer.create!(:answer => "Mount Everest"))

  	render :template => "quizzes/begin.html.erb"

  	expect(rendered).to match /What is the tallest mountain on earth?/
  end
end