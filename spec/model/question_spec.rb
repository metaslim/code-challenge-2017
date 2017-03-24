require_relative '../../lib/model/question'

describe "question model" do
	def question
		@question
	end

	let(:id) { 1 }
	let(:theme) { 'The Work' }
	let(:type) { 'singleselect' }
	let(:text) { 'Manager' }

	let(:question) { Question.create(id, theme, type, text) }

	it "has correct id, theme, type, text" do
		# prevent interference from prev test, it runs well as single test
		Question.reset_registry
		
  	expect(question.id).to eq id
  	expect(question.theme).to eq theme
  	expect(question.type).to eq type
  	expect(question.text).to eq text
  end

  it "does not create duplicate question" do
  	new_question = Question.create(id, theme, type, text)
  	expect(question).to eq new_question
  end
end