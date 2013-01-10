class CreateFinancialReports < ActiveRecord::Migration
  def change
    create_table :financial_reports do |t|
      t.string :name
      t.string :file
      t.string :type

      t.timestamps
    end
  end
end
