# == Schema Information
#
# Table name: end_users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  last_name              :string           not null
#  first_name             :string           not null
#  last_name_kana         :string           not null
#  first_name_kana        :string           not null
#  postal_code            :string           not null
#  address                :string           not null
#  telephone_number       :string           not null
#  is_deleted             :boolean          default(FALSE), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
require 'test_helper'

class EndUserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
