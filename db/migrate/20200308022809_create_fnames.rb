class CreateFnames < ActiveRecord::Migration
  def change
    create_table :fnames do |t|
      t.string :lname
      t.string :email
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
