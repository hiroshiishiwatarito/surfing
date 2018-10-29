module Payments
  class PaypalExpressController < ApplicationController
    AMOUNT_SAMPLE = 10000

    ### PayPalの支払画面に遷移するために必要な情報を取得して
    ### 支払画面にリダイレクトする
    def new
      # 支払画面に飛ぶために必要な情報を取得する
      response = gateway.setup_purchase(
        AMOUNT_SAMPLE,
        ip:                request.remote_ip,
        return_url:        paypal_purchase_url, # PayPalで支払い処理後に戻るURL
        cancel_return_url: paypal_cancel_url,   # PayPalでキャンセル処理後に戻るURL
        items: [
          {
            name: "a subject",         # 件名
            quantity: 1,             # 数量
            amount: AMOUNT_SAMPLE    # 支払い金額
          }])

      # ここでreview: falseに設定するとPayPal側で「今すぐ支払う」というボタン名に変わる
      # trueにすると「同意して支払う」となる
      # ボタン文言が変わるだけでそれ以外の違いは一切ない
      redirect_to gateway.redirect_url_for(response.token, review: false)
    end

    ### PayPalの支払画面で手続き後にアプリケーションに戻ってくるので
    ### 購入処理をする
    def purchase
      # details_forで金額や支払い先などの情報が取得できるので
      # 確認画面を表示したりする時に使う
      # 本記事では確認画面の表示はスキップする
      detail = gateway.details_for(params[:token])

      # 購入処理
      response = gateway.purchase(
        AMOUNT_SAMPLE,
        ip:         request.remote_ip,
        token:      params[:token],
        payer_id:   params[:PayerID],
        notify_url: paypal_ipn_url  # IPNを受け取るURL
                                      # localhostだとPayPalからアクセスできないので
                                      # 開発時にはngrokなどを使う
      )

      if response.success?
        redirect_to paypal_complete_path
      else
        logger.error 'purchase failed.'
      end
    end

    def complete;render 'payments/complete';end
    def cancel;render 'payments/cancel';end

    # IPNを受け取ったときの処理
    def ipn
      response = OffsitePayments::Integrations::Paypal::Notification.new(request.raw_post).extend(PaypalNotification)

      # 対象となる支払いをVERIFYしている
      unless response.acknowledge
        logger.error 'invalid ipn'
        render nothing: true, status: :bad_request
      end

      # 支払い金額が意図した金額になっているのか念のため確認
      if response.completed?(AMOUNT_SAMPLE)
        logger.info 'completed'
      elsif response.refunded?(AMOUNT_SAMPLE)
        logger.info 'refunded'
      else
        logger.error 'failed'
      end

      # HTTPステータス204を返すとPayPal側で決済処理完了として扱われる
      render nothing: true
    end

    private

    def gateway
      ActiveMerchant::Billing.PaypalExpressGateway.new(
          login: '[sandbox accountのUsername]',
          password: '[sandbox accountのPassword]',
          signature: '[sandbox accountのSignature]'
      )
    end
  end

  module PaypalNotification
    def completed?(amount)
      complete? && amount == gross.to_i
    end

    def refunded?(amount)
      status == 'Refunded' && (0 - amount) == gross.to_i
    end
  end
end