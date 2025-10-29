# frozen_string_literal: true

class AddIndexForPostsCreatedAt < ActiveRecord::Migration[8.1]
  def change
    add_index :posts, :created_at
  end
end
