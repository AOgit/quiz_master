require 'rails_helper'

# RSpec tests for Choice validation 
# Status: Passed

RSpec.describe Choice, type: :model do
  before(:each) do
    @query_new = {:question => "What is 'the third rock' from the Sun?",:exam => "id"}
  end
  it "should not save if choice is blank." do
  	@query = Question.new(@query_new)

  	first_choice = Choice.new(:question_id => @query.id, :choice => "")
    second_choice = Choice.new(:question_id => @query.id, :choice => "")
    third_choice = Choice.new(:question_id => @query.id, :choice => "")
    fourth_choice = Choice.new(:question_id => @query.id, :choice => "")

    expect(first_choice).to be_invalid
    expect(second_choice).to be_invalid
    expect(third_choice).to be_invalid
    expect(fourth_choice).to be_invalid
  end	
end