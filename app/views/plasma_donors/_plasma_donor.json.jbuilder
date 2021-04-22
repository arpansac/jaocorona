json.extract! plasma_donor, :id, :name, :phone, :alternate_phone, :blood_group, :city_id, :pincode, :last_verified_at, :unavailable, :fake, :old, :deleted_at, :created_at, :updated_at
json.url plasma_donor_url(plasma_donor, format: :json)
