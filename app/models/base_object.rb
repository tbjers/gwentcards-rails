module BaseObject
  def ensure_slug!
    self.slug ||= generate_slug
  end

private

  def generate_slug
    num = 1
    extra = ''
    loop do
      slug = self.name.parameterize + extra
      break slug unless self.class.find_by(slug: slug, id: { '$ne' => self.id })
      extra = "-#{num}"
      num = num + 1
    end
  end
end
