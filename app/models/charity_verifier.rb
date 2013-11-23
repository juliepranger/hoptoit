class CharityVerifier < ActiveRecord::Base
  belongs_to :organization

  def populateData(files)
    
    files.each do |lstFile|
      file = File.open(lstFile)
      file.each do |line|
        c = CharityVerifier.new(
          ein:line[0..8].strip,
          org_name:line[9..78].strip,
          street_address:line[114..148].strip,
          city:line[149..170].strip,
          state:line[171..172].strip,
          zipcode:line[173..182].strip,
          in_care_of_name:line[79..113].strip,
          subsection_code:line[187..188].strip,
          classification_code:line[190..193].strip,
          affiliation_code:line[189],
          deductability_code:line[200],
          foundation_code:line[201..202].strip,
          eo_status_code:line[213..214].strip,
          income_code:line[228],
          tax_period:line[221..226].strip,
          secondary_name:line[282..316].strip,
          ntee_code:line[278..281].strip
        )
        c.save
      end
    end
  end
  
end
