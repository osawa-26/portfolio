class AddStudyDateToRecord < ActiveRecord::Migration[5.2]
  def change
    add_column :records, :study_date, :date
  end
end
