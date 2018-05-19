class FixColumnNameInResumeItems < ActiveRecord::Migration[5.0]
  def change
    rename_column :resume_items, :name, :title
  end
end
