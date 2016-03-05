class CreateSkillsets < ActiveRecord::Migration
  def change
    create_table :skillsets do |t|
      t.references :profile, index: true, foreign_key: true
      t.references :skill, index: true, foreign_key: true
      t.integer :proficiency

      t.timestamps null: false
    end
  end
end
