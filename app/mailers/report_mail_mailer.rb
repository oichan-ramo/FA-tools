class ReportMailMailer < ApplicationMailer

   default from: "kokugakuin.fatools@gmail.com"

  def send_mail(report)
    @report = report
    mail(
      from: "kokugakuin.fatools@gmail.com",
      to: "ecosiryo@kokugakuin.ac.jp",
      subject: "業務報告",
    )
  end
end
