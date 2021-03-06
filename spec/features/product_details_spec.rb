require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "users can navigate from the home page to the product detail page by clicking on a product" do
    # ACT
    visit root_path

    #VERIFY that there is 10 products
    expect(page).to have_css 'article.product', count: 10

    #look for first article header a (name of product)
    find('article header a', match: :first).click

    #VERIFY css = 'article.product-detail'
    expect(page).to have_css 'article.product-detail'
    
    # DEBUG / VERIFY
    save_screenshot

  end


end

