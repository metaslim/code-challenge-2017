module CultureAmp
	module ResponseHelper
		def total_responses
			decoratee.responses.size
		end

		def number_of_submitted_reponses
			submitted_responses.size
		end
		
		def submitted_responses
			decoratee.responses.select {|response| response.is_submitted?}
		end

	  def questions_for(type)
	  	decoratee.questions.select {|question| question.type == type}
	  end

	  def answers_for(question)
	  	submitted_responses.inject([]) do |answers, response|
	  		answers << response.answers[question.id]
	  	end
	  end
	end
end