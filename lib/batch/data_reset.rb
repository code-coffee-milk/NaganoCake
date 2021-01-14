class Batch::DataReset
  def self.data_reset
    # 投稿を全て削除
    OrderProduct.delete_all
    p "注文商品を全て削除しました"
  end
end