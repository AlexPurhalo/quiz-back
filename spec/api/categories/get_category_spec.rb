require 'helper_spec'

describe 'GET category' do
  before do
    post '/categories', title: 'cartoons'
  end

  it 'shows info about the category' do
    get '/categories/1'

    data = { id: 1, title: 'cartoons' }

    expect(last_response.body).to eq(data.to_json)
  end
end