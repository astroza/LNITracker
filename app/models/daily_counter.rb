class DailyCounter < ActiveRecord::Base
	def self.get_counter(device_id)
		ret = where(:device_id => device_id, :date => Date.parse(Time.now.to_s))
		if not ret.empty?
			ret.first
		else
			create(:device_id => device_id, :date => Date.parse(Time.now.to_s), :counter => 0)
		end
	end
end
