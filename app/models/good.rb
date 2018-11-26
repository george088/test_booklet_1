class Good < ApplicationRecord
  has_many :day, -> { order('created_at DESC') }, dependent: :delete_all
end
