class Article < ApplicationRecord
	# Table
	# Fields
	# Write Methots
  # Validate
  validates :title, presence: true, uniqueness: true
  validates :body, presence: true, length: {minimum: 20}

end
