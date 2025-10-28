# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'should destroy associated posts when user is destroyed' do
    user = users(:one)
    post = posts(:one)

    assert_equal user, post.user
    assert_difference 'Post.count', -1 do
      user.destroy
    end
  end
end
