class Questions < Grape::API
  resources :questions do
    get '/' do
      { message: 'Should renders information about the questions' }
    end
  end
end