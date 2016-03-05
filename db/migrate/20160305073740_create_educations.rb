class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.string :school
      t.string :image
      t.text :description
      t.string :school_url
      t.string :degree
      t.references :profile, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
