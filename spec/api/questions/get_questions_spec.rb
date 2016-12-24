require 'helper_spec'

describe 'GET questions' do
  before do
    post '/questions', description: 'Whoooo, who lives in a pineapple under the sea?', answer: 'SpongeBob SquarePants!'
    post '/questions', description: 'My girl my girl tell me where did you ...', answer: 'sleep last night'
  end

  it 'shows questions list' do
    get '/questions'
    data = [
        { id: 1, description: 'Whoooo, who lives in a pineapple under the sea?', answer: 'SpongeBob SquarePants!' },
        { id: 2, description: 'My girl my girl tell me where did you ...', answer: 'sleep last night' }
    ]

    expect(last_response.body).to eq(data.to_json)
  end
end
