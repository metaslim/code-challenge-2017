require_relative '../../lib/loader/questions_loader'


describe "questions_loader" do
	def questions
		@questions
	end

  let(:survey_csv) {
    <<-CSV
    	theme,type,text
			The Work,ratingquestion,I like the kind of work I do.
			The Work,ratingquestion,"In general, I have the resources (e.g., business tools, information, facilities, IT or functional support) I need to be effective."
			The Work,ratingquestion,We are working at the right pace to meet our goals.
			The Work,ratingquestion,I feel empowered to get the work done for which I am responsible.
			The Work,singleselect,Manager
    CSV
  }

  before do
    @questions = QuestionsLoader.load_from(survey_csv)
  end

  describe "result" do
		it "has 5 question" do
  		expect(questions.size).to eq 5
    end

    it "has correct theme, type, text" do
      expect(questions.first.theme).to include('The Work')
      expect(questions.first.type).to include('ratingquestion')
      expect(questions.first.text).to include('I like the kind of work I do.')
    end

    it "has single select question as last question" do
      expect(questions.last.theme).to include('The Work')
      expect(questions.last.type).to include('singleselect')
      expect(questions.last.text).to include('Manager')
    end

    it "Raise error for bad csv" do
     expect { QuestionsLoader.load_from(nil) }.to raise_error ArgumentError
    end
  end

end
