# Preview all emails at http://localhost:3000/rails/mailers/researchers_confirmation
class ResearchersMailerPreview < ActionMailer::Preview 
  def initialize
    @val=Researcher.first
  end
  def confirmation_instructions        
    ResearchersMailer.confirmation_instructions(@val,@val.confirmation_token , {})    
  end
  def reset_password_instructions         
    ResearchersMailer.reset_password_instructions(@val, @token, {})       
  end
end
