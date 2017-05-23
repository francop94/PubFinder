require 'rails_helper.rb'


feature "login admin" do 

before do
    @admin = FactoryGirl.create(:admin, name: "Administrator")
    @user1 = FactoryGirl.create(:user, name:"Gianluca")
    @user2 = FactoryGirl.create(:user, name:"Giacomo")
    visit login_path
    fill_in "Email", :with => @admin.email
    fill_in "Password", :with => @admin.password
    click_button "Log in"
    expect(page).to have_content('Administrator')
end
    
    scenario "logout" do
    	click_link("account")
        find("a#logout").click
        expect(page).to have_link("Sign up now!")
    end

    scenario "see all users" do
    	click_link "Users"
	expect(page).to have_link("Administrator")
        expect(page).to have_link("Gianluca")
        expect(page).to have_link("Giacomo")
    end

    scenario "validate pubs" do
    	visit root_path
        expect(page).to have_content("Pubs still to validate (0)" )
    end
    
    scenario "validate a pub" do
    	click_link("account")
        find("a#logout").click
        expect(page).to have_link("Sign up now!")
        visit login_path
        fill_in "Email", :with => @user1.email
        fill_in "Password", :with => @user1.password
    	click_button "Log in"
    	expect(page).to have_link('Create your own pub')
        click_link "Create your own pub"
        fill_in "Name", :with => "irish pub"
        fill_in "Address", :with => "via tiburtina 3221, roma"
        click_button "Create my pub"
        expect(page).to have_content("Your pub was created!")
        click_link("account")
        find("a#logout").click
        expect(page).to have_link("Sign up now!")
        visit login_path
        fill_in "Email", :with => @admin.email
        fill_in "Password", :with => @admin.password
    	click_button "Log in"
        visit root_path
        expect(page).to have_content("Pubs still to validate (1)")
        expect(page).to have_content("irish pub")
        click_link "validate"
        expect(page).to have_content("Pubs still to validate (0)")
    end
    
    scenario "see all pubs" do
        click_link("account")
        find("a#logout").click
        expect(page).to have_link("Sign up now!")
        visit login_path
        fill_in "Email", :with => @user1.email
        fill_in "Password", :with => @user1.password
    	click_button "Log in"
    	expect(page).to have_link('Create your own pub')
        click_link "Create your own pub"
        fill_in "Name", :with => "irish pub"
        fill_in "Address", :with => "via tiburtina 3221, roma"
        click_button "Create my pub"
        expect(page).to have_content("Your pub was created!")
        click_link("account")
        find("a#logout").click
        expect(page).to have_link("Sign up now!")
        visit login_path
        fill_in "Email", :with => @admin.email
        fill_in "Password", :with => @admin.password
    	click_button "Log in"
        visit root_path
        expect(page).to have_content("Pubs still to validate (1)")
        expect(page).to have_content("irish pub")
        click_link "validate"
        expect(page).to have_content("Pubs still to validate (0)")
        click_link("All pubs")
        expect(page).to have_link("irish pub")
        expect(page).to have_content("via tiburtina 3221, roma")
    end
    
    scenario "see button delete this pub" do
        click_link("account")
        find("a#logout").click
        expect(page).to have_link("Sign up now!")
        visit login_path
        fill_in "Email", :with => @user1.email
        fill_in "Password", :with => @user1.password
    	click_button "Log in"
    	expect(page).to have_link('Create your own pub')
        click_link "Create your own pub"
        fill_in "Name", :with => "irish pub"
        fill_in "Address", :with => "via tiburtina 3221, roma"
        click_button "Create my pub"
        expect(page).to have_content("Your pub was created!")
        click_link("account")
        find("a#logout").click
        expect(page).to have_link("Sign up now!")
        visit login_path
        fill_in "Email", :with => @admin.email
        fill_in "Password", :with => @admin.password
    	click_button "Log in"
        visit root_path
        expect(page).to have_content("Pubs still to validate (1)")
        expect(page).to have_content("irish pub")
        click_link "validate"
        expect(page).to have_content("Pubs still to validate (0)")
        click_link("All pubs")
        expect(page).to have_link("irish pub")
        expect(page).to have_content("via tiburtina 3221, roma")
        click_link("irish pub")
        expect(page).to have_link("Delete this pub")
    end
   
    scenario "see microposts" do
        click_link("account")
        find("a#logout").click
        expect(page).to have_link("Sign up now!")
        visit login_path
        fill_in "Email", :with => @user1.email
        fill_in "Password", :with => @user1.password
    	click_button "Log in"
    	expect(page).to have_link('Create your own pub')
        click_link "Create your own pub"
        fill_in "Name", :with => "irish pub1"
        fill_in "Address", :with => "via tiburtina 3221, roma"
        click_button "Create my pub"
        expect(page).to have_content("Your pub was created!")
        click_link("your_pubs")
        find("a#pub").click
        fill_in "Compose new micropost...", :with => "this is a new micropost"
        click_button "Post"
        expect(page).to have_content("Micropost created!")
        click_link("account")
        find("a#logout").click
        expect(page).to have_link("Sign up now!")
        visit login_path
        fill_in "Email", :with => @admin.email
        fill_in "Password", :with => @admin.password
    	click_button "Log in"
        visit root_path
        expect(page).to have_content("Pubs still to validate (1)")
        expect(page).to have_content("irish pub")
        click_link "validate"
        expect(page).to have_content("Pubs still to validate (0)")
        click_link("All pubs")
        expect(page).to have_link("irish pub1")
        click_link("irish pub1")
        expect(page).to have_content("Microposts (1)")
        expect(page).to have_content("this is a new micropost")
        click_link("account")
        find("a#logout").click
        expect(page).to have_link("Sign up now!")
        visit login_path
        fill_in "Email", :with => @user2.email
        fill_in "Password", :with => @user2.password
    	click_button "Log in"
    	expect(page).to have_link('Create your own pub')
        click_link "Create your own pub"
        fill_in "Name", :with => "irish pub2"
        fill_in "Address", :with => "via tiburtina 32212, roma"
        click_button "Create my pub"
        expect(page).to have_content("Your pub was created!")
        click_link("your_pubs")
        find("a#pub").click
        fill_in "Compose new micropost...", :with => "this is a new micropost"
        click_button "Post"
        expect(page).to have_content("Micropost created!")
        click_link("account")
        find("a#logout").click
        expect(page).to have_link("Sign up now!")
        visit login_path
        fill_in "Email", :with => @admin.email
        fill_in "Password", :with => @admin.password
    	click_button "Log in"
        visit root_path
        expect(page).to have_content("Pubs still to validate (1)")
        expect(page).to have_content("irish pub2")
        click_link "validate"
        expect(page).to have_content("Pubs still to validate (0)")
        click_link("All pubs")
        expect(page).to have_link("irish pub2")
        click_link("irish pub2")
        expect(page).to have_content("Microposts (1)")
        expect(page).to have_content("this is a new micropost")
    end
    
    scenario "see reviews" do
        click_link("account")
        find("a#logout").click
        expect(page).to have_link("Sign up now!")
        visit login_path
        fill_in "Email", :with => @user1.email
    	fill_in "Password", :with => @user1.password
    	click_button "Log in"
    	expect(page).to have_link('Create your own pub')
        click_link "Create your own pub"
        fill_in "Name", :with => "irish pub1"
        fill_in "Address", :with => "via tiburtina 32211, roma"
        click_button "Create my pub"
        expect(page).to have_content("Your pub was created!") 
    	click_link("account")
        find("a#logout").click
        expect(page).to have_link("Sign up now!")
        visit login_path
        fill_in "Email", :with => @admin.email
    	fill_in "Password", :with => @admin.password
    	click_button "Log in"
   	expect(page).to have_content('Administrator')
        visit root_path
        expect(page).to have_content("Pubs still to validate (1)" )
        expect(page).to have_content("irish pub1")
        click_link "validate"
        expect(page).to have_content("Pubs still to validate (0)")
        click_link("account")
        find("a#logout").click
        visit login_path
        fill_in "Email", :with => @user2.email
    	fill_in "Password", :with => @user2.password
    	click_button "Log in"
    	expect(page).to have_link('Create your own pub')
        click_link "Create your own pub"
        fill_in "Name", :with => "irish pub2"
        fill_in "Address", :with => "via tiburtina 32212, roma"
        click_button "Create my pub"
        expect(page).to have_content("Your pub was created!") 
        click_link("account")
        find("a#logout").click
        expect(page).to have_link("Sign up now!")
        visit login_path
        fill_in "Email", :with => @admin.email
    	fill_in "Password", :with => @admin.password
    	click_button "Log in"
   	expect(page).to have_content('Administrator')
        visit root_path
        expect(page).to have_content("Pubs still to validate (1)" )
        expect(page).to have_content("irish pub2")
        click_link "validate"
        expect(page).to have_content("Pubs still to validate (0)")
        click_link("account")
        find("a#logout").click
        visit login_path
        fill_in "Email", :with => @user1.email
    	fill_in "Password", :with => @user1.password
    	click_button "Log in"
        click_link("All pubs")
        expect(page).to have_link("irish pub1")
        expect(page).to have_link("irish pub2")
        click_link("irish pub2")
        fill_in "Compose new review...", :with => "this is a new review"
        click_button "Post"
        expect(page).to have_content("Review created!")
        click_link("account")
        find("a#logout").click        
        visit login_path
        fill_in "Email", :with => @user2.email
    	fill_in "Password", :with => @user2.password
    	click_button "Log in"
        click_link("All pubs")
        expect(page).to have_link("irish pub1")
        expect(page).to have_link("irish pub2")
        click_link("irish pub1")
        fill_in "Compose new review...", :with => "this is a new review"
        click_button "Post"
        expect(page).to have_content("Review created!")
        click_link("account")
        find("a#logout").click  
        visit login_path 
        fill_in "Email", :with => @admin.email
        fill_in "Password", :with => @admin.password
    	click_button "Log in"
        click_link("All pubs")
        click_link("irish pub1")
        expect(page).to have_content("Reviews (1)")
        expect(page).to have_content("this is a new review")
        click_link("All pubs") 
        click_link("irish pub2")
        expect(page).to have_content("Reviews (1)")
        expect(page).to have_content("this is a new review")
    end
        
    scenario "see an answer" do
        click_link("account")
        find("a#logout").click
        expect(page).to have_link("Sign up now!")
        visit login_path
        fill_in "Email", :with => @user1.email
    	fill_in "Password", :with => @user1.password
    	click_button "Log in"
    	expect(page).to have_link('Create your own pub')
        click_link "Create your own pub"
        fill_in "Name", :with => "irish pub1"
        fill_in "Address", :with => "via tiburtina 32211, roma"
        click_button "Create my pub"
        expect(page).to have_content("Your pub was created!") 
    	click_link("account")
        find("a#logout").click
        expect(page).to have_link("Sign up now!")
        visit login_path
        fill_in "Email", :with => @admin.email
    	fill_in "Password", :with => @admin.password
    	click_button "Log in"
   	expect(page).to have_content('Administrator')
        visit root_path
        expect(page).to have_content("Pubs still to validate (1)" )
        expect(page).to have_content("irish pub1")
        click_link "validate"
        expect(page).to have_content("Pubs still to validate (0)")
        click_link("account")
        find("a#logout").click
        visit login_path
        fill_in "Email", :with => @user2.email
    	fill_in "Password", :with => @user2.password
    	click_button "Log in"
    	expect(page).to have_link('Create your own pub')
        click_link "Create your own pub"
        fill_in "Name", :with => "irish pub2"
        fill_in "Address", :with => "via tiburtina 32212, roma"
        click_button "Create my pub"
        expect(page).to have_content("Your pub was created!") 
        click_link("account")
        find("a#logout").click
        expect(page).to have_link("Sign up now!")
        visit login_path
        fill_in "Email", :with => @admin.email
    	fill_in "Password", :with => @admin.password
    	click_button "Log in"
   	expect(page).to have_content('Administrator')
        visit root_path
        expect(page).to have_content("Pubs still to validate (1)" )
        expect(page).to have_content("irish pub2")
        click_link "validate"
        expect(page).to have_content("Pubs still to validate (0)")
        click_link("account")
        find("a#logout").click
        visit login_path
        fill_in "Email", :with => @user1.email
    	fill_in "Password", :with => @user1.password
    	click_button "Log in"
        click_link("All pubs")
        expect(page).to have_link("irish pub1")
        expect(page).to have_link("irish pub2")
        click_link("irish pub2")
        fill_in "Compose new review...", :with => "this is a new review"
        click_button "Post"
        expect(page).to have_content("Review created!")
        expect(page).to have_link("Answers(0)")
        click_link("Answers(0)")
        expect(page).to have_content("this is a new review")
        fill_in "Compose new answer...", :with => "this is a new answer"
        click_button "Post"
        expect(page).to have_content("Answer created!")
        click_link("account")
        find("a#logout").click        
        visit login_path
        fill_in "Email", :with => @user2.email
    	fill_in "Password", :with => @user2.password
    	click_button "Log in"
        click_link("All pubs")
        expect(page).to have_link("irish pub1")
        expect(page).to have_link("irish pub2")
        click_link("irish pub1")
        fill_in "Compose new review...", :with => "this is a new review"
        click_button "Post"
        expect(page).to have_content("Review created!")
        expect(page).to have_link("Answers(0)")
        click_link("Answers(0)")
        expect(page).to have_content("this is a new review")
        fill_in "Compose new answer...", :with => "this is a new answer"
        click_button "Post"
        expect(page).to have_content("Answer created!")
        click_link("account")
        find("a#logout").click  
        visit login_path 
        fill_in "Email", :with => @admin.email
        fill_in "Password", :with => @admin.password
    	click_button "Log in"
        click_link("All pubs")
        click_link("irish pub1")
        expect(page).to have_content("Reviews (1)")
        expect(page).to have_content("this is a new review")
        expect(page).to have_content("Answers(1)")
        click_link("Answers(1)")
        expect(page).to have_content("this is a new answer")
        click_link("All pubs") 
        click_link("irish pub2")
        expect(page).to have_content("Reviews (1)")
        expect(page).to have_content("this is a new review")
        expect(page).to have_content("Answers(1)")
        click_link("Answers(1)")
        expect(page).to have_content("this is a new answer")
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

