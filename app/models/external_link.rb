class ExternalLink < ApplicationRecord
  belongs_to :city

  default_scope {order('created_at desc')}

end
