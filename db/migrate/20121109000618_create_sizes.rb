class CreateSizes < ActiveRecord::Migration
  def change
    create_table :sizes do |t|
      t.string :size_code
      t.string :size_description

      t.timestamps
    end
  end
end
