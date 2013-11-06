class CreateEztvItems < ActiveRecord::Migration
  def change
    create_table :eztv_items do |t|
      t.string :show_name, null: false
      t.string :episode_title
      t.integer :season
      t.integer :episode
      t.string :link, null: false
      t.string :description
      t.string :comments
      t.string :category
      t.string :guid

      t.timestamps
    end
  end
end
