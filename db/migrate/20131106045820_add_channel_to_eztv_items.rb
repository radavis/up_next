class AddChannelToEztvItems < ActiveRecord::Migration
  def up
    add_column :eztv_items, :channel, :string
  end

  def down
    remove_column :eztv_items, :channel
  end
end
