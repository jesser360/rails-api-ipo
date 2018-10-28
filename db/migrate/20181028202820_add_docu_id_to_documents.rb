class AddDocuIdToDocuments < ActiveRecord::Migration[5.2]
  def change
    add_column :documents, :docu_id, :integer
  end
end
