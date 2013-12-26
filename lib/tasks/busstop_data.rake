namespace :busstop_data do
  desc "TODO"
  task load: :environment do
  	BusStop.delete_all
  	BusStop.create(:name => 'Turbus',                          :latitude => -34.99291, :longitude => -71.23299)
  	BusStop.create(:name => 'Alameda - Buen Pastor',           :latitude => -34.99037, :longitude => -71.23322)
  	BusStop.create(:name => 'San Martin - Chacabuco',          :latitude => -34.98901, :longitude => -71.23508)
  	BusStop.create(:name => 'San Martin - Membrillar',         :latitude => -34.98916, :longitude => -71.23655)
  	BusStop.create(:name => 'San Martin - Carmen',             :latitude => -34.98906, :longitude => -71.23819)
  	BusStop.create(:name => 'Carmen - Estado',                 :latitude => -34.98601, :longitude => -71.23865)
  	BusStop.create(:name => 'UCM',                             :latitude => -34.98411, :longitude => -71.23890)
	BusStop.create(:name => 'Carmen - C. Henriquez (Copec)',   :latitude => -34.98145, :longitude => -71.23931)
	BusStop.create(:name => 'Carmen - C. Henriquez (Entel)',   :latitude => -34.98084, :longitude => -71.23936)
	BusStop.create(:name => 'Carmen (Lider)',                  :latitude => -34.97747, :longitude => -71.23982)
	BusStop.create(:name => 'Freire (Lider)',                  :latitude => -34.97672, :longitude => -71.23922)
	BusStop.create(:name => 'Carmen - Manso de Velazco',       :latitude => -34.97708, :longitude => -71.23578)
	BusStop.create(:name => 'Manso de Velazco - C. Henriquez', :latitude => -34.98063, :longitude => -71.23493)
	BusStop.create(:name => 'Alameda (Unimarc)',               :latitude => -34.98466, :longitude => -71.23449)
	BusStop.create(:name => 'Alameda - Merino Jarpa',          :latitude => -34.99186, :longitude => -71.23368)
	BusStop.create(:name => 'Utal',                            :latitude => -35.001804, :longitude => -71.230390)

  end

end
