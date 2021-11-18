describe Visible do
  extend ActiveSupport::Concern
  include Visible

  let(:user) { create(:user) }
  let(:article) { create(:article, user: user) }

  it { expect(Article.public_count).to be(0) }
  it { expect(article.notpublic?).to be(false) }
  it { expect(article.username(article)).to eql(user.username) }
end
