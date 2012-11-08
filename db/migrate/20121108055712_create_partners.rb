class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.string :name
      t.string :image
      t.string :url

      t.timestamps
    end
  end
end
