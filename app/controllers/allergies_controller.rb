class AllergiesController < ApplicationController

	def new
		@allergy = Allergy.new
	end

	def create
		Allergy.new(params)
	end



end
