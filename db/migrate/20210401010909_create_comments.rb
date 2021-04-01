class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :plan_id
      t.text    :com

      t.timestamps
    end
  end
end
