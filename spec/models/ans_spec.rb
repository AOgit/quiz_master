require 'rails_helper'

# RSpec tests for Answer validation 
# Status: Passed

RSpec.describe Answer, type: :model do
  before(:each) do
    @query_new = {:question => "What is 'the third rock' from the Sun?",:exam => "id"}
  end
  it "should not save if answer is blank." do
  	@query = Question.new(@query_new)
  	answer = Answer.new(:question_id => @query.id, :answer => "")
  	expect(answer).to be_invalid
  end
end