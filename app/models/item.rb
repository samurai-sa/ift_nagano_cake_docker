# == Schema Information
#
# Table name: items
#
#  id           :integer          not null, primary key
#  genre_id     :string           not null
#  name         :string           not null
#  image_id     :string           not null
#  introduction :text             not null
#  price        :integer          not null
#  is_active    :boolean          default(TRUE), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items
  has_many :order_details
  attachment :image
end
