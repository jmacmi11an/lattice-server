class Task < ApplicationRecord
  belongs_to :card, :optional => true
end
