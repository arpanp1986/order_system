class AddAddrssTypes < ActiveRecord::Migration[7.0]
  def change
    AddressType.create(name: "billing")
    AddressType.create(name: "shipping")
  end
end
