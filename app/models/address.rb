# == Schema Information
#
# Table name: addresses
#
#  id          :integer          not null, primary key
#  end_user_id :integer          not null
#  name        :string           not null
#  postal_code :string           not null
#  address     :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Address < ApplicationRecord
  belongs_to :end_user

  def address_display
    '〒' + '' + postal_code + ' ' + address + ' ' + name
  end
end
