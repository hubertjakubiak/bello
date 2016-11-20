class CreateInvitations < ActiveRecord::Migration
  def change
   create_table :invitations do |t|
     t.string :email 
     t.integer :board_id
     t.integer :sender_id
     t.integer :recipient_id
     t.string :token
     t.timestamps
    end
   end 
end
