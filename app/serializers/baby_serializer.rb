class BabySerializer < ActiveModel::Serializer
  attributes :id, :name, :months, :mother_name, :father_name, :address, :phone

  def months
    now = Time.now.utc.to_date
    (now.year * 12 + now.month) - (self.object.birthday.year * 12 + self.object.birthday.month) - ((now.month == self.object.birthday.month && now.day >= self.object.birthday.day) ? 0 : 1)
  end
end


