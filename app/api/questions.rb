class Questions < Grape::API
  resources :questions do
    get '/' do
      @questions = Question.map { |question| question.values }
    end

    post '/' do
      @question = Question.create(description: params[:description], answer: params[:answer]).values
    end

    get '/:id' do
      @question = Question[params[:id]].values
    end
  end
end