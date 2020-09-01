class CreateLinkVisitors < ActiveRecord::Migration[6.0]
  def change
    create_table :link_visitors do |t|
      t.references :link, foreign_key: true, index: true
      t.string :ip_address
      t.string :country

      t.timestamps
    end
  end
end
