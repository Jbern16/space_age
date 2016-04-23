require 'rails_helper'

RSpec.describe Order, type: :model do
  it { should belong_to(:user) }
  it { should have_many(:packages) }
  it { should have_many(:order_packages) }

  it "can retrieve the package sub quantity" do

    package = Package.new(id: 1)
    package.save(validate: false)

    order = Order.new(id: 1)
    order.save(validate: false)

    order_package = OrderPackage.new(order_id: 1, package_id: 1, sub_quantity: 3)
    order_package.save(validate: false)

    expect(order.package_quantity(1)).to eq 3
  end

  it "can retrieve total_quantity" do
    package = Package.new(id: 1)
    package.save(validate: false)

    order = Order.new(id: 1)
    order.save(validate: false)

    order_package1 = OrderPackage.new(order_id: 1, package_id: 1, sub_quantity: 3)
    order_package2 = OrderPackage.new(order_id: 1, package_id: 1, sub_quantity: 3)
    order_package1.save(validate: false)
    order_package2.save(validate: false)


    expect(order.total_quantity).to eq 6
  end

  it "can retrieve package_names" do
    package = Package.new(id: 1, title: "Mars")
    package.save(validate: false)

    order = Order.new(id: 1)
    order.save(validate: false)

    order_package = OrderPackage.new(order_id: 1, package_id: 1)
    order_package.save(validate: false)

    expect(order.package_names).to eq "Mars"
  end
end
