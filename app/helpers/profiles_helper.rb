module ProfilesHelper
  def profile_libravatar(user, size)
    libravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    libravatar_url = "https://seccdn.libravatar.org/avatar/#{libravatar_id}?s=#{size}"
    image_tag(libravatar_url, alt: "@#{user.username}", class: "avatar avatar-user width-full border color-bg-primary d-block", style: "height:auto;", height: size, width: size)
  end
end
