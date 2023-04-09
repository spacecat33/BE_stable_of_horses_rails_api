class Horse < ApplicationRecord
    belongs_to :stable

    validates(:name, { :length => { :minimum => 2 } })
    validates :name, presence: { :message =>  "must be given please" }
    validates :name, uniqueness: {:case_sensitive => false, :message => "is already in use for another horse!"}

    before_save :make_title_case

    def stable_attributes=(stable_name) #expecting this to be a hash
        self.stable = Stable.find_or_create_by(name: stable_name)
    end

    private

    def make_title_case
        # Rails provides a String#titlecase method
        self.name = self.name.titlecase
    end

end
