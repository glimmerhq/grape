class AddNoteToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :note, :text
  end
end
