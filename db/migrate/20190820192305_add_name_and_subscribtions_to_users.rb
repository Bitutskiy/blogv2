class AddNameAndSubscribtionsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string, null: true
    add_column :users, :subscribtion, :string, default: 'weekly'
  end
end
