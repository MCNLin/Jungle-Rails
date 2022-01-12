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

  scenario "users can click the 'Add to Cart' button for a product on the home page and in doing so their cart increases by one" do
    # ACT start at home page
    visit root_path
    
    #VERIFY that there is 10 products
    expect(page).to have_css 'article.product', count: 10
    
    # look for first form button
    find('form.button_to', match: :first).click

    #VERIFY
    expect(page).to have_text 'My Cart (1)'

    # DEBUG
    save_screenshot

  end


end

