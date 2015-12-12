class ResearchersConfirmation  < Devise::Mailer
  helper :application # gives access to all helpers defined within `application_helper`.
  include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`
  default template_path: 'researchers_confirmation', from: 'it-researchers@example.com'  
end
