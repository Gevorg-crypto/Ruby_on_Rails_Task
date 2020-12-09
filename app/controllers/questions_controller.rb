class QuestionsController < ApplicationController
  before_action :authenticate_admin

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    # render plain: params[:post].inspect
    @answer_params = question_params[:answers]
    @answer_hash = Array.new
    @question = Question.new(question_params.except(:answers))
    if @question.save
      @answer_params[:description].each_with_index do |val, index|
        @answer_hash << {:description => val, :right => @answer_params[:right][index+1]}
      end
      @question.answers.create(@answer_hash)
      redirect_to @question
    else
      render 'new'
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  def edit
    @question = Question.find(params[:id])
     @question.answers.build

  end

  def update
    # render plain: params[:post].inspect
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to @question
    else
      render 'edit'
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path
  end


  private

  def question_params
    params.require(:question).permit(:point, :description, answers: [:description => [], :right => []])
  end

end
