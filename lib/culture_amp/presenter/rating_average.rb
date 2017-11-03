require_relative 'base_presenter'

module CultureAmp
  module Presenter
    class RatingAverage < CultureAmp::Presenter::BasePresenter
      def style
        questions_for('ratingquestion').map do |question|
          answers = answers_for(question)
          rating = rating_for(answers)
          "Rating for '#{question.text}' is #{rating}" unless rating.nan?
        end
      end

      private

      def rating_for(answers)
        ((answers.inject(0){|sum,x| sum + x.to_i }) / answers.size.to_f).round(2)
      end
    end
  end
end
