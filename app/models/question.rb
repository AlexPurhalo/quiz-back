class Question < Sequel::Model
  many_to_many :categories, :left_key=>:question_id, :right_key=>:category_id,
               :join_table=>:categories_questions
end