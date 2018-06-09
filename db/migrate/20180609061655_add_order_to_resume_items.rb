class AddOrderToResumeItems < ActiveRecord::Migration[5.0]
  def change
    add_column :resume_items, :order, :Integer
  end
end
