class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.boolean :is_draft
      t.boolean :is_submitted
      t.boolean :is_approved
      t.boolean :is_active
      t.string :body
      t.string :title
      t.string :industry
      t.string :job_type

      t.timestamps
    end
  end
end
