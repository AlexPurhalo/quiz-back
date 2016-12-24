class Categories < Grape::API
  resources :categories do
    get '/' do
      { message: 'Should renders information about the categories' }
    end
  end
end