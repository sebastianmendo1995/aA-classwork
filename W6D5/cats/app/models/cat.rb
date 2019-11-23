
class Cat < ApplicationRecord

  validates :birth_date, :color, :sex, :name, :description, :sex, presence: true 
  validates :sex, inclusion: { in: ['F', 'M'], message: "Invalid sex, choose between 'M' or 'F' "}, length: { is: 1 }
  validates :color, inclusion: { in: ['black', 'brown', 'white', 'green', 'blue'], message: 'Not a valid color'}

  def age
    age = Date.today.year - self.birth_date.year
    age -= 1 if Date.today < self.birth_date + age.years
    age
  end

  has_many :requests,
    foreign_key: :cat_id,
    class_name: 'CatRentalRequest',
    dependent: :destroy
  
end
