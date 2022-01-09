class ChangePatientsPhysiciansTablesAndAddNewDiagnosisItemsTable < ActiveRecord::Migration[6.1]
  def change
    change_table :patients do |t|
      t.string :last_name, null: false, default: "Doe"
      t.integer :age, null: false, default: 1
      t.string :email, null: false, default: "your@email.com"
    end

    change_table :physicians do |t|
      t.string :last_name, null: false, default: "Doe"
      t.string :phone_number, null: false, default: "+380931234567"
      t.string :level, null: false, default: "junior"
    end

    create_table :diagnosis_items do |t|
      t.text :content, null: false, default: "Diagnosis item"
      t.belongs_to :physician
      t.belongs_to :patient
      t.timestamps
    end

    rename_column :patients, :name, :first_name
    change_column_default :patients, :first_name, from: nil, to: "John"
    change_column_null :patients, :first_name, false

    rename_column :physicians, :name, :first_name
    change_column_default :physicians, :first_name, from: nil, to: "John"
    change_column_null :physicians, :first_name, false
  end
end
