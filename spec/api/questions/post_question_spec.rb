require 'helper_spec'

describe 'POST question' do
  it 'renders the data about created question' do
    post '/questions', description: ' Whoooo, who lives in a pineapple under the sea?', answer: 'SpongeBob SquarePants!'

    data = {
        id: 1,
        description: ' Whoooo, who lives in a pineapple under the sea?',
        answer: 'SpongeBob SquarePants!'
    }

    expect(last_response.body).to eq(data.to_json)
  end
end