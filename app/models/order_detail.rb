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
class OrderDetail < ApplicationRecord
  belongs_to :order, dependent: :destroy
  belongs_to :item
  enum making_status: { no_running: 0, produce_waiting: 1, produce_running: 2,  produce_executed: 3 }

end
