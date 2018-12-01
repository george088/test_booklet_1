class Good < ApplicationRecord
  has_many :days, -> { order('created_at DESC') }, dependent: :delete_all
end
