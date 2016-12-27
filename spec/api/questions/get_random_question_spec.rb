require 'helper_spec'

describe 'GET random question' do
  before { Questions.before { env["api.tilt.root"] = "app/views" } }
  def app; Questions end

  before do
    post '/questions', description: 'lol', answer: '228', category: 'blabla'
    post '/questions', description: 'lol2', answer: '2281', category: 'blabla'
    get '/questions/random'
  end

  context 'question includes' do
    it 'description' do
      expect(last_response.body).to include('description')
    end

    it 'answer' do
      expect(last_response.body).to include('answer')
    end

    it 'title of category' do
      expect(last_response.body).to include('title')
    end
  end
end