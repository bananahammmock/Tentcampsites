class ParksController < ApplicationController
	def show
		@park = Park.find_by_slug(params[:park_slug])
		
	end
end