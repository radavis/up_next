class AddEpisodeDateToEztvItems < ActiveRecord::Migration
  def up
    add_column :eztv_items, :episode_date, :string
  end

  def down
    remove_column :eztv_items, :episode_date
  end
end
