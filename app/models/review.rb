class Review < ActiveRecord::Base

  belongs_to :restaurant

  default_scope { order(created_at: :asc) }

end
