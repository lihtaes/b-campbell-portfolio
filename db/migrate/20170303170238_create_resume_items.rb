class CreateResumeItems < ActiveRecord::Migration[5.0]
  def change
    create_table :resume_items do |t|
      t.string :name
      t.string :time_there
      t.string :tech_used

      t.timestamps
    end
  end
end
