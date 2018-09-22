class Favorite < ActiveRecord::Base

  #relation
  belongs_to :store
  belongs_to :user
end
