class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.string :task
      t.references :resume_item, foreign_key: true

      t.timestamps
    end
  end
end
