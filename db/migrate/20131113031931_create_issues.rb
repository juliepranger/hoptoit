class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :title
      t.text :desc
      t.integer :funding_goal
      t.integer :pledged_total
      t.integer :num_backers
      t.datetime :funding_date
      t.integer :votes

      t.timestamps
    end
  end
end
