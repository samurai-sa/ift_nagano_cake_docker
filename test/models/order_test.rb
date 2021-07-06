# == Schema Information
#
# Table name: orders
#
#  id             :integer          not null, primary key
#  end_user_id    :integer          not null
#  postal_code    :string           not null
#  address        :string           not null
#  name           :string           not null
#  shipping_cost  :integer          not null
#  total_payment  :integer          not null
#  payment_method :integer          default("card"), not null
#  status         :integer          default("payment_waiting"), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
