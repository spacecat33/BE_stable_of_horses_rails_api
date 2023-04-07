class Horse < ApplicationRecord
    belongs_to :stable

    validates(:name, { :length => { :minimum => 2 } })
    validates :name, presence: { :message =>  "must be given please" }
    validates :name, uniqueness: {:case_sensitive => false, :message => "is already in use for another horse!"}

    before_save :make_title_case
end
