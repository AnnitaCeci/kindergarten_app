class AddSuperadmin < ActiveRecord::Migration[5.0]
  def change
    User.create! do |u|
      u.email     = 'anaceci.perezmorales@gmail.com'
      u.password  = 'password'
      u.superadmin_role = true
    end
  end
end
