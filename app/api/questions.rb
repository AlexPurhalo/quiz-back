class Questions < Grape::API
  resources :questions do
    get '/', rabl: 'questions/index' do
      @questions = Question.all
    end

    post '/', rabl: 'questions/show' do
      @category = Category.where(title: params[:category]).first
      @category == nil && (@category = Category.create(title: params[:category]))

      @question = Question.create(
          description: params[:description],
          answer: params[:answer],
          category_id: @category.id
      )


    end

    get '/random', rabl: 'questions/show' do
      ids = Array.new

      Question.each do |question|
        ids.push(question.id)
      end

      random_id = ids.sample

      @question = Question[random_id]
      @category = @question.category
    end

    get '/:id', rabl: 'questions/show' do
      @question = Question[params[:id]]
      @category = @question.category
    end
  end
end