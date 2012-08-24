require_relative 'acceptance_helper'

describe "user" do
  include AcceptanceHelper

  it "creating a user redirects to the user page" do
    visit '/users/new'

    fill_in 'name', :with => 'userperson'
    fill_in 'bio',  :with => 'This is my bio.'

    click_button 'submit'

    assert_match /\/users\/[^\/]*$/, page.current_url
  end
end
