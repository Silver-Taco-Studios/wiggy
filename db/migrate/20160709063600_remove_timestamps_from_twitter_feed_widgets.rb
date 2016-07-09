class RemoveTimestampsFromTwitterFeedWidgets < ActiveRecord::Migration
  def change
    remove_column :twitter_feed_widgets, :created_at, :string
    remove_column :twitter_feed_widgets, :updated_at, :string
  end
end
