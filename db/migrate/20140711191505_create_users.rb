class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
       t.string "first_name", :limit=>20
       t.string "last_name", :limit=>60
       t.string "user", :limit=>25
       t.string "email", :limit=>100, :default=>"", :null=>false
       t.string "telephon", :default=>"", :null=>false
       t.string "password_digest"
      t.timestamps
    end
    add_index("users", "user")
  end

  def down
  	drop_table :users 
  end

end
