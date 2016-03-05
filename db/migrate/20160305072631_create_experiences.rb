class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.string :job_title
      t.text :description
      t.string :company_url
      t.string :image
      t.date :from_date
      t.date :to_date
      t.references :profile, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
