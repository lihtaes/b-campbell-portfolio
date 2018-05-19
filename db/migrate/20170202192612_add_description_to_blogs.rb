class AddDescriptionToBlogs < ActiveRecord::Migration[5.0]
  def change
    add_column :blogs, :description, :string
  end
end
