# Preview all emails at http://localhost:3000/rails/mailers/report_mail_mailer
class ReportMailMailerPreview < ActionMailer::Preview

  def report_mail
    report = Report.new(job: "基礎演習",date: "本日",time: "さっき",name: "及川",my_class: "佐藤")

    ReportMailMailer.send_mail(report)
  end

end
