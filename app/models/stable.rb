class Stable < ApplicationRecord
    has_many :horses, dependent: :destroy

    validates(:name, { :length => { :minimum => 2 } })
    validates :name, uniqueness: true, presence: true      

    before_save :make_title_case

    # binding.pry
    # accepts_nested_attributes_for :horses 

    

    def horses_attributes=(name) #expecting this to be a hash
        # binding.pry
        # self.horses = Horse.find_or_create_by(horse_name: horse_name)
        # horse = Horse.find_or_instantiate_by(name: name)
        # horse.stable = self
        # horse.save
        horse = self.horses.build(name: name.values[0]) #this will automatically associate the stable to the horse
        horse.save
    end

    private

    def make_title_case
        # Rails provides a String#titlecase method
        self.name = self.name.titlecase
    end
end
