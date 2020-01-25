# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cat < ApplicationRecord
    validates :name, :birth_date, :sex, :description, presence: true 
    validates :color, inclusion: { in: 
        ['tuxedo', 'orange', 'yellow', 'black', 'grey', 'brown', 'white'], 
        message:  "%{value} is not a valid color"
    }, presence: true

end
