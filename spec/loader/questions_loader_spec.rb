require_relative '../../lib/culture_amp/loader/questions_loader'


describe "questions_loader" do
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

  let(:questions) { CultureAmp::Loader::QuestionsLoader.load_from(survey_csv) }

  describe "result" do
    it "has 5 question" do
      expect(questions.size).to eq 5
    end

    it "has correct theme, type, text" do
      first_question = questions.first
      expect(first_question.theme).to eq('The Work')
      expect(first_question.type).to eq('ratingquestion')
      expect(first_question.text).to eq('I like the kind of work I do.')
    end

    it "has single select question as last question" do
      last_question = questions.last
      expect(last_question.theme).to eq('The Work')
      expect(last_question.type).to eq('singleselect')
      expect(last_question.text).to eq('Manager')
    end

    it "Raise error for bad csv" do
     expect { CultureAmp::Loader::QuestionsLoader.load_from(nil) }.to raise_error ArgumentError
    end
  end

end
