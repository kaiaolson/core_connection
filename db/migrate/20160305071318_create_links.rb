class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :github_url
      t.string :linkedin_url
      t.string :twitter_url
      t.references :profile, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
