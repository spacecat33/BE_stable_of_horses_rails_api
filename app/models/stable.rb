class Stable < ApplicationRecord
    has_many :horses

    validates(:name, { :length => { :minimum => 2 } })
    validates :name, uniqueness: true, presence: true  

    validates :location, uniqueness: true, presence: true
    

    before_save :make_title_case

    private

    def make_title_case
        # Rails provides a String#titlecase method
        self.name = self.name.titlecase
    end
end
