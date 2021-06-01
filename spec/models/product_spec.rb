require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'is not valid with valid attributes' do
      expect(Product.new).to_not be_valid
    end

    it 'should be valid with all valid fields filled out' do
      @cat1 = Category.new(name: "Testing Category")
      @cat1.save!

      @product = @cat1.products.create!({
        name:  'David',
        description: "wowzies",
        quantity: 11,
        price: 2.00
      })

      expect(@product).to be_valid
    end

    it 'should not be valid without a name' do
      @product = Product.new

      @product.name = nil
      @product.description = "whatever"
      @product.quantity = 10
      @product.price = 200

      expect(@product).to_not be_valid
      # expect(@product.errors.full_messages).to exist
    end

    it 'should not be valid without a quantity field' do
      @product = Product.new

      @product.name = 'item'
      @product.description = "whatever"
      @product.quantity = nil
      @product.price = 200

      expect(@product).to_not be_valid
      # expect(@product.errors.full_messages).to exist
    end

    it 'should FAIL validation without a name' do
      @product = Product.new

      @product.name = 'item'
      @product.description = "whatever"
      @product.quantity = 10
      @product.price = nil

      expect(@product).to_not be_valid
      # expect(@product.errors.full_messages).to exist

    end
  end
end
