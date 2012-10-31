class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.String :username
      t.Password :password
      t.String :email

      t.timestamps
    end
  end
end
