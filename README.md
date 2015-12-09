# Discount Shop Kata

We have a shop which sells Mugs, T-shirts and Vouchers. Obviously, each product has its own price but our shop will be able to offer discounts when purchasing several items of the same product. The kind of promotions we have for the moment are:

**Discount promotions**: 

They apply a percentage of discount to every item of that kind in the purchase if you buy at least N units. 
````
For example
	Buy 3 mugs and get a 10% off in every mug
````

**Pack promotions**: 

They are those that when you buy a given number of items of the same kind, you just pay some of them.
````
For example
	Buy 3 t-Shirts and pay only 2
````

**Final price promotions**: 

They are those that, when you buy N units, you pay a known price.
````
For Example
	Buy 3 vouchers and pay 5.5 euro
````

##We must:
* Design a system that allows us to purchase items
* The system must print bills
* The bill must show the total price without discounts
* The bill must show what promotions have been applied to the purchase and show the price after the promotion. If several promotions/discounts can be applied at a time, the one applied will be the most convenient for the client (the cheapest option)
* The system must accept easy changes in promotions, it means, adding new types of promotions and/or modifying existing ones, should be easy

##Restrictions
* Choose an OOP language you don't master
* Do it as good as you can within 8h

##Assumptions
* The shop has unlimited stock
* The promotions are applied only to items of one kind, this means, you wont have to consider promotions when buying, for example, 3 mugs and a voucher
