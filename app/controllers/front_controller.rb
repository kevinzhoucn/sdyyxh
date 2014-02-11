class FrontController < ApplicationController
	def index
	end

	def admin
		@management_list = Category.where(:own_id => nil)
	end
end
