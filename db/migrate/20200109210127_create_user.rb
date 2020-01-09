class CreateUser < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :url, null: false
      t.string :username
      t.string :description
    end
  end
end
