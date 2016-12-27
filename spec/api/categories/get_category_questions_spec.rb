require 'helper_spec'

describe 'GET category questions' do
  before { Categories.before { env["api.tilt.root"] = "app/views" } }

  def app; Categories end

  before do
    post '/categories', title: 'cartoons'
    post '/categories/1/questions/', description: 'what is my Name?', answer: 'Alex'
    post '/categories/1/questions/', description: 'where do I live?', answer: 'Fastov'
  end

  it 'shows data about the categories questions' do
    get '/categories/1/questions'

    data = [
        { id: 1, description: 'what is my Name?', answer: 'Alex' },
        { id: 2, description: 'where do I live?', answer: 'Fastov' }
    ]

    expect(last_response.body).to eq(data.to_json)
  end
end