class Category < Sequel::Model
  many_to_many :questions, :left_key=>:category_id, :right_key=>:question_id,
               :join_table=>:categories_questions
end