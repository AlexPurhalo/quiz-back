class Categories < Grape::API
  resources :categories do
    get '/', rabl: 'categories/index' do
      @categories = Category.all
    end

    post '/', rabl: 'categories/show' do
      @category = Category.create(title: params[:title])
    end

    get '/:id' do
      @category = Category[params[:id]].values
    end

    post '/:id/questions', rabl: 'questions/show' do
      @category = Category[params[:id]]
      @question = Question.create(description: params[:description], answer: params[:answer])
      @category.add_question(@question)
      @question
    end

    get ':id/questions', rabl: 'questions/index' do
      @questions = Category[params[:id]].questions_dataset
    end
  end
end