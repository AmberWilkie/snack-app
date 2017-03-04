class DefaultFalseToReadColumns < ActiveRecord::Migration[5.0]
  def up
    change_column :messages, :sender_read, :boolean, default: false, null: false
    change_column :messages, :recipient_read, :boolean, default: false, null: false
  end

  def down
    change_column :messages, :sender_read, :boolean
    change_column :messages, :recipient_read, :boolean
  end
end
