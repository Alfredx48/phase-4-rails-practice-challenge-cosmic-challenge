class Mission < ApplicationRecord
  belongs_to :scientist
  belongs_to :planet

  # validates_presence_of :name, :planet_id, :scientist_id
  # validates_uniqueness_of :scientist_id
  validates_presence_of :name
  validates :scientist, uniqueness: { scope: :name }
end
