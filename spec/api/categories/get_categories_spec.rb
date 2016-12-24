require 'helper_spec'

describe 'GET answers' do
  def app
    App
  end

  before { get '/categories' }

  it 'renders info about the answers list' do
    data = { message: 'Should renders information about the categories' }
    expect(last_response.body).to eq(data.to_json)
  end
end
