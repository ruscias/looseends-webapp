heroku pg:reset DATABASE_URL -a looseends --confirm looseends && heroku run rake db:migrate -a looseends && heroku run rake db:seed -a looseends