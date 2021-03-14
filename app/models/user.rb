class User < ApplicationRecord
    attr_accessor :remember_token
    enum kind: [:Consumidor, :Fornecedor]
    enum status: [:activo, :inactivo]
    #relacoes
    has_one_attached :avatar
    has_many :notifications, foreign_key: :recipient_id
    has_one :perfil_empresarial, dependent: :destroy
    has_one :empresa, :through => :perfil_empresarial
    has_one :contacto, dependent: :destroy
    has_one :endereco, dependent: :destroy
    has_many :queixas, dependent: :destroy
    has_many :addempresas, dependent: :destroy
    has_many :ordems, dependent: :destroy
    belongs_to :empresa, dependent: :destroy, optional: true

    #has_one :historico_empresarial
  #  accepts_nested_attributes_for :perfil_empresarials, allow_destroy: true
    accepts_nested_attributes_for :contacto, allow_destroy: true
    accepts_nested_attributes_for :endereco, allow_destroy: true
    before_save {self.email = email.downcase}

def displayed_image
  if avatar.attached?
    avatar
  else
    "blank.png"
  end
end

    validate :acceptable_image_type?

    def acceptable_image_type?
      return unless avatar.attached?
      return if avatar.content_type.in? ["image/png", "image/jpeg"]
      errors.add :avatar, "Só imagens com menos de 1mb"
      end

    validates :nome, presence: true, length: {maximum: 50}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: {maximum: 255},
              format: {with: VALID_EMAIL_REGEX},
              #uniqueness: true
              uniqueness: {case_sensitive: false}

    has_secure_password
    validates :password, presence: true, length: {minimum: 6}, allow_nil: true

    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                      BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
      end

    def User.new_token
      SecureRandom.urlsafe_base64
    end


    def remember
      self.remember_token = User.new_token
      update_attribute(:remember_digest, User.digest(remember_token))
      end

      # Returns true if the given token matches the digest.
       def authenticated?(remember_token)
         return false if remember_digest.nil?
         BCrypt::Password.new(remember_digest).is_password?(remember_token)
       end

      def forget
        update_attribute(:remember_digest, nil)
      end

      def feed
         Queixa.all
       end

       def perfil
          Empresa.all
        end


    end
