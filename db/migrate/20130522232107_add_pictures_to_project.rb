class AddPicturesToProject < ActiveRecord::Migration
  def change
    create_table :project_pictures do |t|
      t.string :image
      t.references :project

      t.timestamps
    end
  end
end
