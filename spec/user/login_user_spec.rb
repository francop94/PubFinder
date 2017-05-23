require 'rails_helper.rb'



feature "create user" do
    scenario "user creation" do
        visit signup_path
        fill_in "Name", :with => "Giorgio"
        fill_in "Email", :with => "myrchemical@mail.com"
        fill_in "Password", :with => "password_molto_segreta"
        fill_in "Confirmation", :with => "password_molto_segreta"
        click_button "Create my account"
        expect(page).to have_content("Please check your email to activate your account.")
    end
end


feature "login user" do 

before do
    @user = FactoryGirl.create(:user, name:"Gianluca")
    visit login_path
    fill_in "Email", :with => @user.email
    fill_in "Password", :with => @user.password
    click_button "Log in"
    expect(page).to have_link('Create your own pub')
    
end

    scenario "see create pub button" do 
        expect(page).to have_link('Create your own pub')
    end

    scenario "create pub and see it" do 
        click_link "Create your own pub"
        fill_in "Name", :with => "irish pub"
        fill_in "Address", :with => "via tiburtina 3221, roma"
        click_button "Create my pub"
        expect(page).to have_content("Your pub was created!")
        click_link("your_pubs")
        find("a#pub").click
        expect(page).to have_link("Upload menu")
    end

    scenario "see all users" do
    	click_link "Users"
        expect(page).to have_link("Gianluca")
    end
    
    scenario "logout" do
    	click_link("account")
        find("a#logout").click
        expect(page).to have_link("Sign up now!")
    end

    scenario "favorite pubs" do
    	visit root_path
        expect(page).to have_content("Your visited pubs (0)" )
    end

    scenario "visited pubs" do
    	visit root_path
        expect(page).to have_content("Your visited pubs (0)")
    end
    
    scenario "new micropost" do
    	click_link "Create your own pub"
        fill_in "Name", :with => "irish pub"
        fill_in "Address", :with => "via tiburtina 3221, roma"
        click_button "Create my pub"
        expect(page).to have_content("Your pub was created!")
        click_link("your_pubs")
        find("a#pub").click
        fill_in "Compose new micropost...", :with => "this is a new micropost"
        click_button "Post"
        expect(page).to have_content("Micropost created!")
    end
 
    scenario "edit micropost" do
    	click_link "Create your own pub"
        fill_in "Name", :with => "irish pub"
        fill_in "Address", :with => "via tiburtina 3221, roma"
        click_button "Create my pub"
        expect(page).to have_content("Your pub was created!")
        click_link("your_pubs")
        find("a#pub").click
        fill_in "Compose new micropost...", :with => "this is a new micropost"
        click_button "Post"
        expect(page).to have_content("Micropost created!")
	click_link "edit"
        expect(page).to have_content("this is a new micropost")
    end

    scenario "see upload menu page" do
    	click_link "Create your own pub"
        fill_in "Name", :with => "irish pub"
        fill_in "Address", :with => "via tiburtina 3221, roma"
        click_button "Create my pub"
        expect(page).to have_content("Your pub was created!")
        click_link("your_pubs")
        find("a#pub").click
        click_link "Upload menu"
        expect(page).to have_content("Upload Menu")
	expect(page).to have_button("Upload Menu")
    end
    
    scenario "edit pub's informations" do
    	click_link "Create your own pub"
        fill_in "Name", :with => "irish pub"
        fill_in "Address", :with => "via tiburtina 3221, roma"
        click_button "Create my pub"
        expect(page).to have_content("Your pub was created!")
        click_link("your_pubs")
        find("a#pub").click
        click_link "Edit pub's informations"
        expect(page).to have_button("Save changes")
        fill_in "Website", :with => "www.corriere.it"
        fill_in "Description", :with => "This is a beautiful place to drink a beer"
        click_button "Save changes"
        expect(page).to have_content("Pub updated")  
    end
   
    scenario "see all pub's informations" do
    	click_link "Create your own pub"
        fill_in "Name", :with => "irish pub"
        fill_in "Address", :with => "via tiburtina 3221, roma"
        click_button "Create my pub"
        expect(page).to have_content("Your pub was created!")
        click_link("your_pubs")
        find("a#pub").click
        click_link "Edit pub's informations"
        expect(page).to have_button("Save changes")
        fill_in "Website", :with => "www.corriere.it"
        fill_in "Description", :with => "This is a beautiful place to drink a beer"
        click_button "Save changes"
        expect(page).to have_content("irish pub")  
        expect(page).to have_content("via tiburtina 3221, roma")
        expect(page).to have_link("Visit website")
        expect(page).to have_content("This is a beautiful place to drink a beer")
    end
    
    

end

feature "help link" do 
    scenario "help link" do 
        visit help_path
        expect(page).to have_content("Soon a Facebook page will be created. Stay tuned!")
    end
end
feature "home link" do 
    scenario "home link" do 
        visit root_path
        expect(page).to have_link("Sign up now!")
    end
end
