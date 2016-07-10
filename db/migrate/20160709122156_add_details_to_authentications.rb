class AddDetailsToAuthentications < ActiveRecord::Migration
  def change
    add_column :authentications, :uid, :string
    add_column :authentications, :provider, :string
  end
end
