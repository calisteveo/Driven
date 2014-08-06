class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :fb_id
      t.string :name
      t.string :oauth_token
      t.datetime :oauth_expires_at
      t.string :phone
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :fb_pic_url
      t.string :email

      t.timestamps
    end
  end
end
