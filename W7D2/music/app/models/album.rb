class Album < ApplicationRecord

    validates :band_id, :name, :year, presence: true
    validates :live, inclusion: { in: [true, false] }
    validates :name, uniqueness: { scope: :band_id }
    validates :year, numericality: { minimun: 1900, maximum: 9000 }

    belongs_to :band
    has_many :tracks, dependent: :destroy

end
