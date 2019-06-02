# Products Api
JSON Api compliant endpoint for a products resource, using [jsonapi-resources](https://github.com/cerebris/jsonapi-resources).  
CRUD operations on product.  
Search product by name.  
Update only price and category for a product.  
## Installation
```bash
docker-compose build
docker-compose run web rake db:setup
docker-compose run web rake db:seed
docker-compose up
```
## Running specs
```bash
docker-compose run web rake
```

