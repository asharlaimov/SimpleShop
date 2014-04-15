class CreateRecommendeds < ActiveRecord::Migration
  def change
    create_table :recommendeds do |t|
      t.belongs_to :product, index: true
      t.integer :position

      t.timestamps
    end
  end
end
