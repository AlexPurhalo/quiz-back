require 'helper_spec'

describe 'GET questions' do
  before { Questions.before { env["api.tilt.root"] = "app/views" } }

  def app; Questions end

  before do
    post '/questions',
         description: 'Whoooo, who lives in a pineapple under the sea?',
         answer: 'SpongeBob SquarePants!',
         category: 'cartoons'
    post '/questions',
         description: 'My girl my girl tell me where did you ...',
         answer: 'sleep last night',
        category: 'cartoons'

  end

  it 'shows questions list' do
    get '/questions'
    data = [
        {
            id: 1,
            description: 'Whoooo, who lives in a pineapple under the sea?',
            answer: 'SpongeBob SquarePants!'
        },
        {
            id: 2,
            description: 'My girl my girl tell me where did you ...',
            answer: 'sleep last night'
        }
    ]

    expect(last_response.body).to eq(data.to_json)
  end
end
