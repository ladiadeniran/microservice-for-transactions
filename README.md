# README

### Dependencies
1. Install Ruby 3.0 (ruby-install and chruby)
2. PostgresQL (Postgres.app recommended)
3. Rails 7

### Running Locally
1. Clone the repo
2. Navigate to the repo and run `bundle install` to install the gems
3. Create and setup database with seed data `bin/rails db:create db:setup db:seed`
4. Run  the rails server `bin/rails server`
5. Test API endpoints with curl or POSTMAN(recommended)


### Data Relationship
There are 3 Models
1. Customer - requires an email and has an ID
2. Currency - requires name and symbol and optional code
3. Transaction - requires a customer id, input currency id, output currency id, input amount, output amount and transaction date

### Routes
Assuming you are running on the default port i.e 3000
The root route is `localhost:3000` and all the other routes are preceded with this

1. GET `/` or GET `/v1/transactions` gives a list of the paginated transactions.

  ```

  Sample Response
  {
    "transactions": [
        {
            "id": "6666d7cf-e809-4186-a52c-c173d7bdecda",
            "customer": {
                "id": "682e4c3a-9cef-49b4-b95a-4969fff38e3d",
                "email": "user1@gmail.com"
            },
            "input_amount": {
                "amount": 10.0,
                "currency_name": "dollar",
                "currency_code": "USD",
                "currency_symbol": "$"
            },
            "output_amount": {
                "amount": 6550.0,
                "currency_name": "naira",
                "currency_code": "Naira",
                "currency_symbol": "N"
            },
            "transaction_date": "2022-09-17T01:26:18Z"
        }
    ],
    "page": 1,
    "items": 30,
    "totalPages": 1
  }
```

  2. POST `/v1/transactions` Create a new Transaction
  ```
    Sample Request
    {
      "transaction": {
          "customer_id": "8a4eb3e6-17bb-4f22-be5a-697e8eb736d5",
          "input_amount": 300,
          "input_currency_id": "75b677aa-4311-48cd-b7a3-b08a2d0b98bc",
          "output_amount": "350",
          "output_currency_id": "17dee17c-6099-4219-896c-9e3992b51bad",
          "transaction_date": "2022-09-17 01:26:18"
      }
    }

    Sample Response
    {
    "id": "5e47e8a1-c944-431c-a122-a9b21dfc81ad",
    "customer": {
        "id": "8a4eb3e6-17bb-4f22-be5a-697e8eb736d5",
        "email": "user2@gmail.com"
    },
    "input_amount": {
        "amount": 300.0,
        "currency_name": "euro",
        "currency_code": "Euro",
        "currency_symbol": "E"
    },
    "output_amount": {
        "amount": 350.0,
        "currency_name": "dollar",
        "currency_code": "USD",
        "currency_symbol": "$"
    },
    "transaction_date": "2022-09-17T01:26:18Z"
}
  ```
  3. PUT `/v1/transactions/:id` Update a transaction
  ```
    Sample Request
    {
      "transaction": {
          "input_amount": 3000,
          "output_amount": "3500",
      }
    }

    Sample Response
    {
    "id": "5e47e8a1-c944-431c-a122-a9b21dfc81ad",
    "customer": {
        "id": "8a4eb3e6-17bb-4f22-be5a-697e8eb736d5",
        "email": "user2@gmail.com"
    },
    "input_amount": {
        "amount": 3000.0,
        "currency_name": "euro",
        "currency_code": "Euro",
        "currency_symbol": "E"
    },
    "output_amount": {
        "amount": 3500.0,
        "currency_name": "dollar",
        "currency_code": "USD",
        "currency_symbol": "$"
    },
    "transaction_date": "2022-09-17T01:26:18Z"
}
  ```
  4. DELETE `/v1/transactionss/:id` Delete a transaction
  ```
  Deletes the notification
  ```
  5. GET `/v1/transactionss/:id`
  ```

  Sample Response

  {
    "id": "5e47e8a1-c944-431c-a122-a9b21dfc81ad",
    "customer": {
        "id": "8a4eb3e6-17bb-4f22-be5a-697e8eb736d5",
        "email": "user2@gmail.com"
    },
    "input_amount": {
        "amount": 300.0,
        "currency_name": "euro",
        "currency_code": "Euro",
        "currency_symbol": "E"
    },
    "output_amount": {
        "amount": 350.0,
        "currency_name": "dollar",
        "currency_code": "USD",
        "currency_symbol": "$"
    },
    "transaction_date": "2022-09-17T01:26:18Z"
}

  ```
  6. GET `/v1/customers` Get a list of customers
  ```
    Sample Response
   {
    "customers": [
        {
            "id": "682e4c3a-9cef-49b4-b95a-4969fff38e3d",
            "email": "user1@gmail.com"
        },
        {
            "id": "8a4eb3e6-17bb-4f22-be5a-697e8eb736d5",
            "email": "user2@gmail.com"
        },
        {
            "id": "413df902-27c2-4ea0-817c-962e12f344a1",
            "email": "user3@gmail.com"
        }
    ],
    "page": 1,
    "items": 30,
    "totalPages": 1
   }
```
  7. GET `/v1/currencies` Get a list of currencies
```
  {
    "currencies": [
        {
            "id": "75b677aa-4311-48cd-b7a3-b08a2d0b98bc",
            "code": "USD",
            "name": "dollar",
            "symbol": "$"
        },
        {
            "id": "17dee17c-6099-4219-896c-9e3992b51bad",
            "code": "Euro",
            "name": "euro",
            "symbol": "E"
        },
        {
            "id": "6ba23924-57b9-49f4-b755-8a9cb14d1490",
            "code": "Naira",
            "name": "naira",
            "symbol": "N"
        }
    ],
    "page": 1,
    "items": 30,
    "totalPages": 1
  }
```
