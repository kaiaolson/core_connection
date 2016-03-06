class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.references :profile, index: true, foreign_key: true
      t.references :project, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
