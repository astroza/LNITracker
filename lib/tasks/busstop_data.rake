namespace :busstop_data do
  desc "TODO"
  task load: :environment do
  	Busstop.delete_all
  	Busstop.create(:name => 'Turbus',                          :latitude => -34.99291, :longitude => -71.23299)
  	Busstop.create(:name => 'Alameda - Buen Pastor',           :latitude => -34.99037, :longitude => -71.23322)
  	Busstop.create(:name => 'San Martin - Chacabuco',          :latitude => -34.98901, :longitude => -71.23508)
  	Busstop.create(:name => 'San Martin - Membrillar',         :latitude => -34.98916, :longitude => -71.23655)
  	Busstop.create(:name => 'San Martin - Carmen',             :latitude => -34.98906, :longitude => -71.23819)
  	Busstop.create(:name => 'Carmen - Estado',                 :latitude => -34.98601, :longitude => -71.23865)
  	Busstop.create(:name => 'UCM',                             :latitude => -34.98411, :longitude => -71.23890)
    Busstop.create(:name => 'Carmen - C. Henriquez (Copec)',   :latitude => -34.98145, :longitude => -71.23931)
    Busstop.create(:name => 'Carmen - C. Henriquez (Entel)',   :latitude => -34.98084, :longitude => -71.23936)
    Busstop.create(:name => 'Carmen (Lider)',                  :latitude => -34.97747, :longitude => -71.23982)
    Busstop.create(:name => 'Freire (Lider)',                  :latitude => -34.97672, :longitude => -71.23922)
    Busstop.create(:name => 'Carmen - Manso de Velazco',       :latitude => -34.97708, :longitude => -71.23578)
    Busstop.create(:name => 'Manso de Velazco - C. Henriquez', :latitude => -34.98063, :longitude => -71.23493)
    Busstop.create(:name => 'Alameda (Unimarc)',               :latitude => -34.98466, :longitude => -71.23449)
    Busstop.create(:name => 'Alameda - Merino Jarpa',          :latitude => -34.99186, :longitude => -71.23368)
    Busstop.create(:name => 'Utal',                            :latitude => -35.001804, :longitude => -71.230390)

  end

end
