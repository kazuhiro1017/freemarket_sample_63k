class Address < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :prefecture, optional: true
end
