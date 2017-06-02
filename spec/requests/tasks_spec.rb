require 'rails_helper'

RSpec.describe "Tasks", type: :request do
  let(:user){User.create(name: "ping", email:"ping@na.com", password: "123456", password_confirmation: "123456")}
  describe "Tasks" do
    describe "GET /tasks" do
      it "displays tasks" do
        user.tasks.create(:title => "paint fence")
        visit user_tasks_path(user)
        page.should have_content("paint fence")
      end
      
      it "supports js", :js => true do
        user_tasks_path
        click_link "Create Now!"
        page.should have_content("Title")
      end
    end
    
    describe "POST /tasks" do
      it "creates task" do
        visit new_user_task_path
        fill_in "Title", :with => "mow lawn"
        click_button "Add task"
        # save_and_open_page
        page.should have_content("mow lawn")
      end
    end
  end
end
