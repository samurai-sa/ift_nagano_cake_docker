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
class Order < ApplicationRecord

  belongs_to :end_user
  has_many :order_details
  enum payment_method: { card: 0, cash: 1 }
  enum status: { payment_waiting: 0, confirm: 1, running: 2, shipment_waiting: 3, executed: 4 }

end
