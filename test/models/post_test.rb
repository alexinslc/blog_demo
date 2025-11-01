# frozen_string_literal: true

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test 'discard sets discarded_at and excludes from kept scope' do
    post = posts(:one)

    assert_not post.discarded?
    assert_includes Post.kept, post

    post.discard
    post.reload

    assert post.discarded?
    assert_not_includes Post.kept, post
    assert_includes Post.discarded, post
  end
end
