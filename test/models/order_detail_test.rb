# == Schema Information
#
# Table name: order_details
#
#  id            :integer          not null, primary key
#  order_id      :integer          not null
#  item_id       :integer          not null
#  price         :integer          not null
#  amount        :integer          not null
#  making_status :integer          default("no_running"), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
require 'test_helper'

class OrderDetailTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
