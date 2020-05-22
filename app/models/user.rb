class User < ApplicationRecord
  validates :name, {presence:true}
  validates :student_number, {presence:true,uniqueness: true}
  validates :my_class, {presence:true}

  

has_secure_password

end
