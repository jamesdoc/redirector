# README

## Set up

```bash
bundle install
bin/rails db:migrate
bin/rails db:seed #todo
bin/rails server
```

In your hosts file set up a test redirect

```
sudo vi /etc/hosts

# add in
127.0.0.1 redirect.dv
```



## todo

- [ ] Allow users to be invited
- [ ] Basic hit stats
- [ ] [Wire in 2fa](https://github.com/devise-two-factor/devise-two-factor)
