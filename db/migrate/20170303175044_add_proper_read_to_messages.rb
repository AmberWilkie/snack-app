class AddProperReadToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :sender_read, :boolean
    add_column :messages, :recipient_read, :boolean
    remove_column :messages, :read
  end
end
