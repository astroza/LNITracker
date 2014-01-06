class PredictionController < ApplicationController
	def perform
		orig_ltd = params['device_id']
		dest_ltd = params['dest_ltd']
		dest_lng = params['dest_lng']
		@prediction = 10
		@time_unit = "seg"
	end
end
