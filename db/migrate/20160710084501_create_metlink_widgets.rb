class CreateMetlinkWidgets < ActiveRecord::Migration
  def change
    create_table :metlink_widgets do |t|
      t.integer :stop_id

      t.timestamps null: false
    end
  end
end
