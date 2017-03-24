require_relative '../../lib/model/question'

describe "question" do
	def question
		@question
	end

	let(:id) { 1 }
	let(:theme) { 'The Work' }
	let(:type) { 'singleselect' }
	let(:text) { 'Manager' }

	before do
		@question = Question.create(id, theme, type, text)
  end

	it "has correct id, theme, type, text" do
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