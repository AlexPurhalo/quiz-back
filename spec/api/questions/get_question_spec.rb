require 'helper_spec'

describe 'GET question' do
  before do
    post '/questions', description: 'Whoooo, who lives in a pineapple under the sea?', answer: 'SpongeBob SquarePants!'
  end

  it 'shows info about the single question' do
    get '/questions/1'

    data = { id: 1, description: 'Whoooo, who lives in a pineapple under the sea?', answer: 'SpongeBob SquarePants!'}

    expect(last_response.body).to eq(data.to_json)
  end
end