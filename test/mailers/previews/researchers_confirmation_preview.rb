# Preview all emails at http://localhost:3000/rails/mailers/researchers_confirmation
class ResearchersConfirmationPreview < ActionMailer::Preview
  def confirmation_instructions
    val=Researcher.last
    ResearchersConfirmation.confirmation_instructions(val,val.confirmation_token , {})
  end
end
