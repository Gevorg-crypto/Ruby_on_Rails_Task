class AnswersController < ApplicationController

  def create
    # render plain: params[:post].inspect
    @question = Question.find(params[:id])
    @answers = @question.answers.create(answers_params)
  end

  def edit
    @question = Question.find(params[:id])
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
  def answers_params
    params.require(:answer).permit(:right,:description)
  end
end
