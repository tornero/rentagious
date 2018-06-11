class AddRecipientFullNameToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :recipientFullName, :Text
  end
end
