class CreateMenuTypes < ActiveRecord::Migration
  def change
    create_table :menu_types do |t|
      t.string :title

      t.timestamps
    end
  end
end
