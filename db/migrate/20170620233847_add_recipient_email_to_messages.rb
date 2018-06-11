class AddRecipientEmailToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :recipientEmail, :Text
  end
end
