object @question => :question
attributes :id, :description, :answer

child @category => :category do
    attributes :title
end