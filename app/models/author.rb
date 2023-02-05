class Author < ApplicationRecord
    validates :name, presence: true
    validates :email, uniqueness: {case_sensistive: true}
end
