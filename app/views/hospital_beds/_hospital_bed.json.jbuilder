json.extract! hospital_bed, :id, :hospital_name, :contact_name, :phone, :alternate_phone, :address, :city_id, :icu_beds, :beds, :unavailable, :fake, :old, :last_verified_at, :created_at, :updated_at
json.url hospital_bed_url(hospital_bed, format: :json)
