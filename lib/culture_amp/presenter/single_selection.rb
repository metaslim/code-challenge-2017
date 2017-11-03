require_relative 'base_presenter'

module CultureAmp
  module Presenter
    class SingleSelection < CultureAmp::Presenter::BasePresenter
      def style
        questions_for('singleselect').map do |question|
          answers = answers_for(question)
          "#{question.text} are #{answers.join(", ")}" unless answers.empty?
        end
      end
    end
  end
end
