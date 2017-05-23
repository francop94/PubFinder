require 'rails_helper.rb'



feature "create user" do
    scenario "user creation" do
        visit signup_path
        fill_in "Name", :with => "giacomino"
        fill_in "Email", :with => "myrchemical@mail.com"
        fill_in "Password", :with => "password_molto_segreta"
        fill_in "Confirmation", :with => "password_molto_segreta"
        click_button "Create my account"
        expect(page).to have_content("Please check your email to activate your account.")
    end
end


feature "login user" do 

before do
    user = FactoryGirl.create(:user, name: "ciaonee")
    visit login_path
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    click_button "Log in"
    expect(page).to have_link('Create your own pub')
    
end

    scenario "see create pub button" do 
        expect(page).to have_link('Create your own pub')
    end

    scenario "create pub" do 
        click_link "Create your own pub"
        fill_in "Name", :with => "irish pub"
        fill_in "Address", :with => "via tiburtina 3221, roma"
        click_button "Create my pub"
        expect(page).to have_content("Your pub was created!")
        click_link("your_pubs")
        find("a#pub").click
        expect(page).to have_link("Upload menu")
    end

    scenario "see the created pub" do 
        
    end

end


feature "help link" do 
    scenario "help link" do 
        visit help_path
        expect(page).to have_link ("Rails Tutorial help page")
    end
end
