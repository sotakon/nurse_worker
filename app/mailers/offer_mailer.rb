class OfferMailer < ApplicationMailer
  def offer_mail(favorite)
    @favorite = favorite
    mail to: @favorite.corporation.email, subject: "オファー完了のお知らせ"
  end

  def offer_corporation_mail(favorite)
    @favorite = favorite
    mail to: @favorite.user.email, subject: "法人から面接オファーが届きました"
  end
end
