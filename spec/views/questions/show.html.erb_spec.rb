require 'rails_helper'

# Status: Passed

describe "rendering the show question and answer page" do
  it "displays the question and the answer" do
  	assign(:query, Question.create!(:question => "What is the tallest mountain on earth?", :exam => "id"))
  	assign(:answer, Answer.create!(:answer => "Mount Everest"))

  	render :template => "questions/show.html.erb"

  	expect(rendered).to match /What is the tallest mountain on earth?/
  	expect(rendered).to match /Mount Everest/
  end
end