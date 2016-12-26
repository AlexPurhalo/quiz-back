Sequel.migration do
  change do
    create_table :categories_questions do
      primary_key :id
      foreign_key :question_id, :questions
      foreign_key :category_id, :categories
    end
  end
end

# cartoons = Category.create(title: "cartoons")
# goobka = Question.create(:description => "who lives...?", answer: "Goobka")
# goobka.add_category(cartoons)
