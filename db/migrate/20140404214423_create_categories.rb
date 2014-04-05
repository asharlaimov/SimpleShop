class CreateCategories < ActiveRecord::Migration
  def change
    change_table :products do |t|
      t.belongs_to :category, index: true
    end

    create_table :categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
