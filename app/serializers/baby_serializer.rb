class BabySerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :phone, :group
end
