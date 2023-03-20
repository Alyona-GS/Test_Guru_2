class QuestionsController < ApplicationController
  before_action :find_question, except: %i[index new create]
  before_action :find_test, except: %i[show edit update]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions
    respond_to do |format|
      format.text { render plain: "All questions" }
      format.html { render :index }
    end
  end

  def show; end

  def new
    @question = Question.new
  end

  def edit; end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to @question
    else
      render :edit
    end
  end

  def destroy
    byebug
    logger.debug "Debug #{@question.inspect}"
    @question.delete
    redirect_to test_questions_path
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)   
  end

  def rescue_with_question_not_found
    render plain: "Question was not found"
  end
end
