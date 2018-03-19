class CreatePrimaryChineseResults < ActiveRecord::Migration[5.1]
  def change
    create_table :primary_chinese_results do |t|
      t.belongs_to :result, index: true
      t.string :openid
      t.string :unionid
      t.string :form
      t.string :form_name
      t.text :entry
      t.string :gen_code
      t.datetime :form_created_at
      t.datetime :form_updated_at

      t.timestamps
    end

    add_index :primary_chinese_results, :openid
    add_index :primary_chinese_results, :unionid
    add_index :primary_chinese_results, :form
    add_index :primary_chinese_results, :gen_code
  end
end
