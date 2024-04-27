class CreateLinks < ActiveRecord::Migration[7.1]
  def change

    create_table :accounts do |t|
      t.string :hostname, index: true
      t.string :account_name
      t.string :default_fallback
      t.timestamps
    end

    create_table :links do |t|
      t.belongs_to :account, index: true, foreign_key: true
      t.string :url
      t.string :token
      t.string :redirect_type, default: "301"
      t.string :description, null: true
      t.timestamps

      t.index [:token, :account_id], unique: true
    end

  end
end
