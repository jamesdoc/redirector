
account = Account.find_or_create_by!(
  hostname: 'redirect.dv',
  account_name: 'Test redirect',
  default_fallback: 'https://example.com'
)

account2 = Account.find_or_create_by!(
  hostname: 'hidden.dv',
  account_name: 'Second test',
  default_fallback: 'https://example.org'
)

[
  {
    account_id: account.id,
    url: 'https://example.com',
    token: 'test',
    redirect_type: '302'
  },
  {
    account_id: account.id,
    url: 'https://example.com/test',
    token: 'test-two',
    redirect_type: '302'
  },
].each do |link|
  Link.create(link)
end

[
  {
    account_id: account2.id,
    url: 'https://example.com',
    token: 'hello',
    redirect_type: '302'
  },
  {
    account_id: account2.id,
    url: 'https://example.com/test',
    token: 'test-world',
    redirect_type: '302'
  },
].each do |link|
  Link.create(link)
end

User.create(
  email: 'test@test.com',
  password: 'password',
  account_id: account.id,
)

User.create(
  email: 'test2@test.com',
  password: 'password',
  account_id: account.id,
)
