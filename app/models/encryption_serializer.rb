class EncryptionSerializer
  def initialize(secret)
    @secret = secret
  end

  def load(crypted)
    return if crypted.nil?

    encryptor.decrypt_and_verify(crypted)
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    nil
  end

  def dump(text)
    encryptor.encrypt_and_sign(text)
  end

  private

  def encryptor
    @encryptor ||= ::ActiveSupport::MessageEncryptor.new(@secret, cipher: 'aes-256-cbc')
  end
end
