require 'helper_spec'

describe 'POST question' do
  before { Questions.before { env["api.tilt.root"] = "app/views" } }
  def app; Questions end

  it 'renders the data about created question' do
    post '/questions',
         description: 'Whoooo, who lives in a pineapple under the sea?',
         answer: 'SpongeBob SquarePants!',
         category: 'cartoons'

    data = {
        id: 1,
        description: 'Whoooo, who lives in a pineapple under the sea?',
        answer: 'SpongeBob SquarePants!',
        category: { title: 'cartoons' }
    }

    expect(last_response.body).to eq(data.to_json)
  end
end