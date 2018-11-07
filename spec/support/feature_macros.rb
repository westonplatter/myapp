# frozen_string_literal: true

module FeatureMacros
  def login_stripe_connected_user
    @user = FactoryBot.create(:user)
    login_user(@user)
  end

  def login_user(user=nil)
    @user = user || FactoryBot.create(:user)
    login_as(@user, :scope => :user)
  end

  def visit_and_confirm(path)
    visit path
    expect(page.current_path).to eq(path)
    expect(page.status_code).to eq(200)
  end

  def visit_and_redirect(path, redirect_path)
    visit path
    expect(page.current_path).to eq(redirect_path)
    expect(page.status_code).to eq(200)
  end

  def wait_for_ajax
    Timeout.timeout(Capybara.default_max_wait_time) do
      loop until finished_all_ajax_requests?
    end
  end

  def finished_all_ajax_requests?
    page.evaluate_script('jQuery.active').zero?
  end
end
