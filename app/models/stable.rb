class Stable < ApplicationRecord
    has_many :horses

    validates(:name, { :length => { :minimum => 2 } })
    validates :name, uniqueness: true, presence: true  

    validates :location, uniqueness: true, presence: true
    

    before_save :make_title_case
end
