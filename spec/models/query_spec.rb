require 'rails_helper'

# RSpec tests for Question validation 
# Status: Passed

RSpec.describe Question, type: :model do
  it "should not save if question and exam are blank." do
    query = Question.new(question:'', exam: '')
    expect(query).to be_invalid
  end
  it "should not save if question is less than 15 characters." do
    query = Question.new(question: 'What is life?', exam: 'id')
    expect(query).to be_invalid
  end
end

# RSpec test for destroying dependent answer of question (for Identification and True or False type)
# Status: Passed

RSpec.describe Question, type: :model do
  before(:each) do
    @query_new = {:question => "What is your name?",:exam => "id"}
  end
  it "should destroy dependent answer." do
    @query = Question.new(@query_new)
    answer = Answer.new(:question_id => @query.id,:answer =>"Justin")
    @query.destroy
    # Answer.find_by_id(answer.id).should be_nil (deprecated)
    expect(answer.id).to be_nil
  end
end

# RSpec test for destroying dependent answer and choices of question (for Multiple Choice type) 
# Status: Passed

RSpec.describe Question, type: :model do
  before(:each) do
  	@query_new = {:question => "What is the capital of Japan?",:exam => "mc"}
  end
  it "should destroy dependent answer and choices." do
    @query = Question.new(@query_new)

    first_choice = Choice.new(:question_id => @query.id, :choice => "Osaka")
    second_choice = Choice.new(:question_id => @query.id, :choice => "Tokyo")
    third_choice = Choice.new(:question_id => @query.id, :choice => "Sapporo")
    fourth_choice = Choice.new(:question_id => @query.id, :choice => "Kyoto")
    answer = Answer.new(:question_id => @query.id, :answer => "Tokyo")
    @query.destroy

    expect(first_choice.id).to be_nil
    expect(second_choice.id).to be_nil
    expect(third_choice.id).to be_nil
    expect(fourth_choice.id).to be_nil
    expect(answer.id).to be_nil
  end
end 



