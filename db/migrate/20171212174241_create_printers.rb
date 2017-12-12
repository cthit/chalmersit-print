class CreatePrinters < ActiveRecord::Migration[5.1]
  def change
    create_table :printers do |t|
      t.string  "name"
      t.string  "location"
      t.string  "media"
      t.integer "weight",   default: 0
      t.boolean "duplex",   default: true
      t.boolean "deleted",  default: false
    end
  end
end
