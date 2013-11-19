class IssuesOrganizations < ActiveRecord::Migration
  def change
  	  	create_table :issues_organizations do |t|
      	t.belongs_to :issue
      	t.belongs_to :organization
     end 	
  end
end
