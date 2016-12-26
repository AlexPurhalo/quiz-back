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

    post '/:id/questions' do
      @category = Category[params[:id]]
      @question = Question.create(description: params[:description], answer: params[:answer])
      @category_question = @category.add_question(@question)
      @category_question.values
    end

    get ':id/questions' do
      @category_questions = Category[params[:id]].questions.map { |questions| questions.values }
    end
  end
end