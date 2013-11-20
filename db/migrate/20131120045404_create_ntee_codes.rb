class CreateNteeCodes < ActiveRecord::Migration
  def change
    create_table :ntee_codes do |t|
      t.string :common_code
      t.string :core_code
      t.string :description

      t.timestamps
    end
  end
end
