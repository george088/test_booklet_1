class Day < ApplicationRecord
  belongs_to :good

  def revenue
    self[:revenue]
  end
end
