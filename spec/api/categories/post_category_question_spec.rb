require 'helper_spec'
describe 'POST category question' do
  before { Categories.before { env["api.tilt.root"] = "app/views" } }
  def app; Categories end

  before { post '/categories', title: 'cartoons' }

  it 'shows the data about the posted question' do
    post '/categories/1/questions/', description: 'what is my Name?', answer: 'Alex'

    data = {
        id: 1,
        description: 'what is my Name?',
        answer: 'Alex',
        category: { title: 'cartoons' }
    }

    expect(last_response.body).to eq(data.to_json)
  end
end