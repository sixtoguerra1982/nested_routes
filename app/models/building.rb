class Building < ApplicationRecord
    has_many :apartments, dependent: :destroy


    def to_s
        self.name
    end
end
