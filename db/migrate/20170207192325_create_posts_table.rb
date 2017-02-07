class CreatePostsTable < ActiveRecord::Migration
  def change
    create_table :posts do |p|
      p.string :name
      p.text :content
    end
  end
end
