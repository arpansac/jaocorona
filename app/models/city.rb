class City < ApplicationRecord

  default_scope {order(:name)}
end
