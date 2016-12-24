Sequel.migration do
  change do
    create_table :questions do
      primary_key :id
      Text :description, null: false
      String :answer, null: false
    end
  end
end