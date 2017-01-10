class CreateJoinTablePostsCategory < ActiveRecord::Migration[5.0]
  def change
    create_join_table :categories, :posts
  end
end
