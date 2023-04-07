class Horse < ApplicationRecord
    belongs_to :stable

    validates(:name, { :length => { :minimum => 2 } })
    validates :name, presence: { :message =>  "must be given please" }
    validates :name, uniqueness: {:case_sensitive => false, :message => "is already in use for another horse!"}

    before_save :make_title_case

    private

    def make_title_case
        # Rails provides a String#titlecase method
        self.name = self.name.titlecase
    end

    def stable_attributes=(stable_name, stable_location)
        self.stable = Stable.find_or_create_by(stable_name: name, location: stable_location)
    end
end
