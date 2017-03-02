class QuizzesController < ApplicationController
  
  def index
    @questions = Question.all
  end

  def new
  end

  def create_query
    recent_query = Question.new(question: params[:question], exam: params[:q_type])

    if recent_query.valid?
      recent_query.save

      if recent_query.exam == "id"
        redirect_to "/quizzes/identification"
      end
      if recent_query.exam == "mc"
        redirect_to "/quizzes/multiple_choice"
      end
      if recent_query.exam == "tf"
        redirect_to "/quizzes/true_false"
      end
    else 
      flash[:create_query_errors] = recent_query.errors.full_messages
      redirect_to :back
    end  
  end

  def identify
    @recent_query = Question.last
  end

  def post_answer_id
    answer_id = Answer.create(question: Question.last, answer: params[:answer_id])

    if answer_id.valid?
      redirect_to "/"
    else
      flash[:create_answer_error] = answer_id.errors.full_messages
      redirect_to :back
    end
  end

  def multiple_choice
    @recent_query = Question.last
  end

  def post_answer_mc
    answer_mc = Answer.new(question: Question.last, answer: params[:answer_mc])
    choice_one = Choice.new(question: Question.last, choice: params[:choice_one])
    choice_two = Choice.new(question: Question.last, choice: params[:choice_two])
    choice_three = Choice.new(question: Question.last, choice: params[:choice_three])
    choice_four = Choice.new(question: Question.last, choice: params[:answer_mc])

    if answer_mc.valid? && choice_one.valid? && choice_two.valid? && choice_three.valid?
      answer_mc.save
      choice_one.save
      choice_two.save
      choice_three.save
      choice_four.save
      
      redirect_to "/"
    else
      flash[:choice_answer_error] = "Please fill in ALL the choices and the answer entries!"
      redirect_to :back
    end  
  end

  def true_false
    @recent_query = Question.last
  end

  def post_answer_tf
    answer_tc = Answer.new(question: Question.last, answer: params[:choice])
    # choice_true = Choice.new(question: Question.last, choice: "True")
    # choice_false = Choice.new(question: Question.last, choice: "False")

    if answer_tc.valid?
      answer_tc.save
      # choice_true.save
      # choice_false.save

      redirect_to "/"
    else
      flash[:tf_answer_error] = "Please provide the answer, either True or False."
      redirect_to :back  
    end 
  end

  def begin

    # session.clear

    index_queries = Question.count - 1

    if !session['quiz'] && !session['a']
      session['a'] = (0..index_queries).to_a.shuffle 
      session['quiz'] = session['a'].pop
      session['score'] = 0
    end

    # puts session['a']

    @questions = Question.limit(Question.count)
    @question = @questions[session['quiz']]
    @answer = Answer.where(question: @question.id).first

    if @question.exam == 'mc'
      @choices = Choice.where(question: @question.id)

      a = (0..3).to_a.shuffle 
      b = a.pop
      c = a.pop
      d = a.pop
      e = a.pop

      @first_choice = @choices[b]
      @second_choice = @choices[c]
      @third_choice = @choices[d]
      @fourth_choice = @choices[e]
    end

  end

  def process_answer

    u_ans = params[:answer]
    r_ans = params[:r_answer]

    human_num = r_ans.to_i.humanize

    if u_ans == r_ans || u_ans == human_num
      flash[:response] = "Correct!"
      session['score'] += 1
    else
      flash[:response] = "Incorrect."
    end

    if session['a'].length == 0
      flash[:score] = "#{session['score']} / #{Question.count}"
      flash[:finish] = "You have finished the quiz. You may reset the quiz, review, or go to home page."
    end

    redirect_to '/quizzes/begin'

  end

  def next_question
    session['quiz'] = session['a'].pop
    redirect_to '/quizzes/begin'
  end

  def reset
    session.clear
    redirect_to '/quizzes/begin'
  end

end
