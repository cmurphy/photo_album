class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :name
      t.text :caption
      t.string :url

      t.timestamps
    end
  end
end
