class AddPublicPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :public, :boolean, default: true
  end

  def down
    remove_column :posts, :public
  end
end
