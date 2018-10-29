class Artist < ApplicationRecord
  has_many :tasks
  belongs_to :user, optional: true
end
