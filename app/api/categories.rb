class Categories < Grape::API
  resources :categories do
    get '/' do
      @categories = Category.map { |category| category.values }
    end

    post '/' do
      @category = Category.create(title: params[:title]).values
    end

    get '/:id' do
      @category = Category[params[:id]].values
    end
  end
end