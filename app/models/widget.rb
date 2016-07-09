class Widget < ActiveRecord::Base
  actable
  belongs_to :user

  # needs to validate presence of common fields
end
