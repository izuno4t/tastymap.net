class Store < ActiveRecord::Base

	#relations
	belongs_to :user
	has_many :photos
	has_many :favorites

	#validations
	validates_presence_of :name, :lat, :lng
	validates_numericality_of :lat, :lng
	
	#act_as
	acts_as_taggable

end
