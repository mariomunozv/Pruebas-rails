
scaffold:
	rails g scaffold product \
		barcode:integer \
		brand:string \
		name:string \
		description: \
		price:integer \
		price_net:integer \
		family:references;

	rails g scaffold family \
		name:string \
		description:string;

destroy:
	# Your destroy here
	rails destroy scaffold product;
	rails destroy scaffold family;

migrate:
	rake db:drop:all
	rake db:create
	rake db:migrate
	rake db:seed

redo: destroy scaffold 
	rake db:seed
	rails s
