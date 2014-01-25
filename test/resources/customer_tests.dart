library customer_tests;

import "dart:convert";

import 'package:unittest/unittest.dart';

import '../../lib/stripe.dart';


var exampleObject = """
                    {
                      "object": "customer",
                      "created": 1390621405,
                      "id": "cus_3N7bW2v8TfGKvk",
                      "livemode": false,
                      "description": "Random description",
                      "email": "test@example.com",
                      "delinquent": false,
                      "metadata": {
                        "test": "yeah"
                      },
                      "subscription": null,
                      "discount": null,
                      "account_balance": 0,
                      "currency": "usd",
                      "cards": {
                        "object": "list",
                        "count": 0,
                        "url": "/v1/customers/cus_3N7bW2v8TfGKvk/cards",
                        "data": [
                    
                        ]
                      },
                      "default_card": null
                    }""";


main() {

  group('Customer', () {


    test("fromMap() properly popullates all values", () {
      var map = JSON.decode(exampleObject);

      var customer = new Customer.fromMap(map);

      expect(customer.created, equals(new DateTime.fromMillisecondsSinceEpoch(map["created"] * 1000)));
      expect(customer.id, equals(map["id"]));
      expect(customer.livemode, equals(map["livemode"]));
      expect(customer.description, equals(map["description"]));
      expect(customer.email, equals(map["email"]));
      expect(customer.delinquent, equals(map["delinquent"]));
      expect(customer.metadata, equals(map["metadata"]));
      expect(customer.subscription, equals(map["subscription"]));
      expect(customer.discount, equals(map["discount"]));
      expect(customer.accountBalance, equals(map["account_balance"]));
      expect(customer.currency, equals(map["currency"]));
      expect(customer.cards, new isInstanceOf<CustomerCardCollection>());
      expect(customer.cards.count, map["cards"]["count"]);
      expect(customer.cards.url, map["cards"]["url"]);
      expect(customer.defaultCard, equals(map["default_card"]));
    });

  });

}