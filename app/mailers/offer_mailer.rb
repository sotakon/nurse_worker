class OfferMailer < ApplicationMailer
  def offer_mail(favorite)
    @favorite = favorite
    mail to: @favorite.corporation.email, subject: "スカウト完了のお知らせ"
  end

  def offer_corporation_mail(favorite)
    @favorite = favorite
    mail to: @favorite.user.email, subject: "法人様からスカウトが届きました"
  end
end
