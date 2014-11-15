class Trainee < ActiveRecord::Base
	belongs_to :trainer
	has_many :exercises
	has_many :foods

end
