require 'helper_spec'

describe 'GET categories' do
  before do
    post '/categories', title: 'first record'
    post '/categories', title: 'second record'
  end


  it 'renders the all categories' do
    get '/categories'

    data = [{ id: 1, title: 'first record' }, { id: 2, title: 'second record'}]

    expect(last_response.body).to eq(data.to_json)
  end
end
