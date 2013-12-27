class PredictionController < ApplicationController
	def perform
		orig_ltd = params['orig_ltd']
		orig_lng = params['orig_lng']
		dest_ltd = params['dest_ltd']
		dest_lng = params['dest_lng']
		@prediction = 10
		@time_unit = "seg"
	end
end
