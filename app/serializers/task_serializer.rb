class TaskSerializer < ActiveModel::Serializer
  attributes :id, :description, :complete
end
