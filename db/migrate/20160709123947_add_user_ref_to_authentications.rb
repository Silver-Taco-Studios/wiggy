class AddUserRefToAuthentications < ActiveRecord::Migration
  def change
    add_reference :authentications, :user, index: true, foreign_key: true
  end
end
