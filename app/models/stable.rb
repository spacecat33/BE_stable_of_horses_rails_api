class Stable < ApplicationRecord
    has_many :horses

    validates(:name, { :length => { :minimum => 2 } })
    validates :name, uniqueness: true, presence: true      

    before_save :make_title_case

    accepts_nested_attributes_for :horses
    

    # def horses_attributes=(horse_name) #expecting this to be a hash
    #     binding.pry
    #     self.horses = Horse.find_or_create_by(name: horse_name)
    # end

    private

    def make_title_case
        # Rails provides a String#titlecase method
        self.name = self.name.titlecase
    end
end
