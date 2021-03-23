class FavoriteMailer < ApplicationMailer
  def favorite_mail(favorite)
    @favorite = favorite
    mail to: @favorite.user.email, subject: "エントリー完了のお知らせ"
  end

  def favorite_corporation_mail(favorite)
    @favorite = favorite
    mail to: @favorite.job.corporation.email, subject: "看護師エントリーのお知らせ"
  end
end
