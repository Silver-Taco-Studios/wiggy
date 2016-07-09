class CreateTwitterFeedWidgets < ActiveRecord::Migration
  def change
    create_table :twitter_feed_widgets do |t|

      t.timestamps null: false
    end
  end
end
