require 'helper_spec'

describe 'POST category' do
  before { Categories.before { env["api.tilt.root"] = "app/views" } }

  def app; Categories end

  it 'renders crated category' do
    post '/categories', title: 'some_title'

    expect(last_response.body).to eq({ id: 1, title: 'some_title' }.to_json)
  end
end