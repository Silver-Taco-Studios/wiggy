class AddNameToWidget < ActiveRecord::Migration
  def change
    add_column :widgets, :name, :string
  end
end
