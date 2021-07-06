# == Schema Information
#
# Table name: cart_items
#
#  id          :integer          not null, primary key
#  item_id     :integer          not null
#  end_user_id :integer          not null
#  amount      :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'test_helper'

class CartItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
