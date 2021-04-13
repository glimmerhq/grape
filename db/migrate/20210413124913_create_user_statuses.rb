class CreateUserStatuses < ActiveRecord::Migration[6.1]
  def change
    create_table :user_statuses do |t|
      t.text :body
      t.integer :anime

      t.timestamps
    end
  end
end
