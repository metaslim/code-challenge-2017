require_relative '../lib/culture_amp/loader/loader_pack'
require_relative '../lib/culture_amp/presenter/presenter_pack'
require_relative '../lib/culture_amp/report/base_report'


describe "integration" do
	def report
		@report
	end
	
	let(:response_csv) {
    <<-CSV
    	employee1@abc.xyz,1,2014-07-28T20:35:41+00:00,5,5,5,4,Sally
			employee2@abc.xyz,2,2014-07-29T07:05:41+00:00,4,5,5,3,Jane
			employee3@abc.xyz,3,2014-07-29T17:35:41+00:00,5,5,5,5,John
			employee4@abc.xyz,4,,5,5,5,4,Bob
			employee5@abc.xyz,5,2014-07-31T11:35:41+00:00,4,5,5,2,Mary
    CSV
  }

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
    questions = CultureAmp::Loader::QuestionsLoader.load_from(survey_csv)
		responses = CultureAmp::Loader::ResponsesLoader.load_from(response_csv)

		@report = CultureAmp::Report::BaseReport.new(questions, responses)
  end

  describe "result" do
		it "shows correct participation percentage" do
  		expect(report.add_presenter(CultureAmp::Presenter::ParticipationPercentage.new).build).to include('The participation percentage', '80%')
    end

    it "shows correct total participant" do
  		expect(report.add_presenter(CultureAmp::Presenter::TotalParticipant.new).build).to include('The total participant', '5')
    end

    it "shows correct rating average" do
  		expect(report.add_presenter(CultureAmp::Presenter::RatingAverage.new).build).to include('Rating for', '4.5', '5.0', '5.0', '3.5')
    end

    it "shows correct single answers" do
  		expect(report.add_presenter(CultureAmp::Presenter::SingleSelection.new).build).to include('Manager', 'Sally', 'Jane', 'John', 'Mary')
    end


  end

end
