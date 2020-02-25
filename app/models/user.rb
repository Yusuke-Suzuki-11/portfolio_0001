class User < ApplicationRecord
  has_many :chat_messages
  has_many :chat_room_users
  has_many :posts, dependent: :destroy
  has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
  has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
  has_many :followings, through: :following_relationships
  has_many :followers, through: :follower_relationships
  has_many :likes
  has_many :comments

  mount_uploader :profile_photo, ProfilePhotoUploader
  

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  validates :name, presence: true, length: { maximum: 50 }
  

  enum gender: %i(未選択 男子 女子), _prefix: true

  enum sports_event: %i(
    未選択 アーチェリー ウエイトリフティング カヌー ゴルフ サーフィン サッカー スケートボード セーリング ソフトボール テコンドー テニス 軟式テニス トライアスロン バスケットボール バドミントン バレーボール ハンドボール フェンシング ボート ラグビー レスリング 近代五種 空手 自転車 柔道 水泳 体操 卓球 馬術 野球 軟式野球 陸上 肉体改造部
  ), _prefix: true

  enum sports_stage: %i(未選択 中学生 高校生 大学生 社会人 シニア), _prefix: true

  enum sports_level: %i(未選択 趣味 部活 アマチュア プロ), _prefix: true

  enum area: %i(未選択 北海道 青森県 岩手県 宮城県 秋田県 山形県 福島県 茨城県 栃木県 群馬県 埼玉県 千葉県 東京都 神奈川県 新潟県 富山県 石川県 福井県 山梨県 長野県 岐阜県 静岡県 愛知県 三重県 滋賀県 京都府 大阪府 兵庫県 奈良県 和歌山県 鳥取県 島根県 岡山県 広島県 山口県 徳島県 香川県 愛媛県 高知県 福岡県 佐賀県 長崎県 熊本県 大分県 宮崎県 鹿児島県 沖縄県 海外), _prefix: true

  def update_without_current_password(params, *options)
    params.delete(:current_password)
    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end
    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end

  def following?(other_user)
    following_relationships.find_by(following_id: other_user.id)
  end

  def follow!(other_user)
    following_relationships.create!(following_id: other_user.id)
  end

  def unfollow!(other_user)
    following_relationships.find_by(following_id: other_user.id).destroy
  end
end
