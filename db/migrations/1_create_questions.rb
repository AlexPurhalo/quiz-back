Sequel.migration do
  change do
    create_table :questions do
      primary_key :id
      Text :description, null: false
      String :answer, null: false
      foreign_key :category_id
    end
  end
end