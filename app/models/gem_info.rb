class GemInfo < ApplicationRecord
	validates :url, presence: true, uniqueness: true
	

	scope :published_today, -> { where('gem_infos.created_at >= ?', 1.day.ago) }
end
