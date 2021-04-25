json.plasma_donors do
  json.total @plasma_donors[0]
  json.last_updated (!@plasma_donors[1].blank? ?  (@plasma_donors[1].last_verified_at || @plasma_donors[1].updated_at) : 'NA')
end

json.hospital_beds do
  json.total @hospital_beds[0]
  json.last_updated (!@hospital_beds[1].blank? ?  (@hospital_beds[1].last_verified_at || @hospital_beds[1].updated_at) : 'NA')
end

json.oxygen_suppliers do
  json.total @oxygen_suppliers[0]
  json.last_updated (!@oxygen_suppliers[1].blank? ?  (@oxygen_suppliers[1].last_verified_at || @oxygen_suppliers[1].updated_at) : 'NA')
end

json.medicines do
  json.total @medicines[0]
  json.last_updated (!@medicines[1].blank? ?  (@medicines[1].last_verified_at || @medicines[1].updated_at) : 'NA')
end