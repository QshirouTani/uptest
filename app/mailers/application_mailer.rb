class ApplicationMailer < ActionMailer::Base
  #default from: "from@example.com"
  default from: "管理者<info@depot.com>"
  layout 'mailer'
end
