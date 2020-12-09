module Api
  module V1
    class GamesController < ApplicationController
      skip_before_action :verify_authenticity_token
      before_action :authenticate_request

      def index
        @questions = Question.all
        if @questions
          @questions = @questions.map { |e|
            e.attributes.merge({:answers => e.answers})
          }
        end
        render json: @questions
      end

      def create
        @current_user.scores.create(game_params)
      end

      private

      def game_params
        params.require(:game).permit(:total_point, :total_question)
      end
    end
  end
end