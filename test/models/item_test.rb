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
require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
