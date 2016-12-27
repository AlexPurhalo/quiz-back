require 'helper_spec'

describe 'GET question' do
  before { Questions.before { env["api.tilt.root"] = "app/views" } }
  def app; Questions end

  before do
    post '/questions', description: 'lol', answer: '228', category: 'blabla'
  end


  it 'shows data about user' do
    get '/questions/1'

    data = { id: 1, description: 'lol', answer: '228', category: { title: 'blabla' } }

    expect(last_response.body).to eq(data.to_json)
  end
end