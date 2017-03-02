class QuestionsController < ApplicationController
  
  def show
  	@query = Question.find(params[:id])
  	@answer = Question.find(params[:id]).answer
  end

  def ans_key
    @questions = Question.all
    @answers = Answer.all
  end

  def edit
  	@query = Question.find(params[:id])
  	@answer = Question.find(params[:id]).answer

  	if @query.exam == 'mc' || @query.exam == 'tf'
  	  @choices = @query.choices
  	end

  end

  def update 
    Question.find(params[:id]).update(question: params[:question])
    Question.find(params[:id]).answer.update(answer: params[:answer])

    if params[:type] == "id" || params[:type] == "tf"
    	redirect_to :back
    end
    if params[:type] == "mc"
      Question.find(params[:id]).choices.first.update(choice: params[:choice_one])
      Question.find(params[:id]).choices.second.update(choice: params[:choice_two])
      Question.find(params[:id]).choices.third.update(choice: params[:choice_three])
      Question.find(params[:id]).choices.fourth.update(choice: params[:answer])
      redirect_to :back
    end
  end

  def destroy
      Question.find(params[:id]).destroy
      redirect_to :back
  end

end