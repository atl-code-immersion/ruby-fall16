A rental company has hired you to develop a simple rental application based on Ruby, so they can rent their available cars to customers.  

Your application should use classes, and at a minimum have a Customer, and Vehicle class.  

###Acceptance Criteria:

  • Developers should have access to the source code, and be able to collaborate with the code (read: create a GitHub repo) 
  
  • Users should have the ability to input Vehicle details (year, make, model) into the application, and list them.
    
  • Users should have the ability to input Customer details (first name, last name, age, city) into the application, and list them.
    
  • Users should be able to rent, or assign Vehicles to Customers
    
  • Users should not be able to rent unavailable vehicles, but a renter CAN rent multiple vehicles

  • The application should remember your choices even after it closes

  
## Steps  
* Create a sub folder called "car_rental" in your TTS/Ruby folder
```
.
|-- Desktop                  
|   |-- TTS
|   |   `-- Ruby
|   |   |   `-- car_rental
```
* Create a file called "main_program.rb" with ```puts "hello" ``` in that folder
* Create a repository on GitHub, and follow the instructions to push your repo up to GitHub
* In your main program, create a menu that displays 4 dummy options, and outputs your selected option
```console
*************************************************
****  Welcome to the Car Rental Application  ****
*************************************************
****  Please select from the following menu: ****
**** 1. Option 1
**** 2. Option 2
**** 3. Option 3
**** 4. Option 4
3
You chose option 3
```
* Add error checking/validation so that the menu ONLY accepts one of the menu options. If anything else is selected, exit the program. 
* Now, put all that into a method called `display_menu` and test. 

> Push to GitHub (commit message: "added menu method")

Your code should look something like this:
```ruby
def display_menu
  ...code to display menu...
end 

display_menu

```
* Next we want to be able to add vehicles to our inventory, and add the menu item, but first we need to build the Vehicle class. 
* Build a Vehicle class with attributes: year, make and model.  Include methods to access those attributes, and test your class.  

> Push to GitHub (commit message: "added Vehicle class")

* Now that we have a Vehicle class, let's build the `add_a_vehicle` method to create instances of the class.  Build the method so it asks the user for a year, a make and a model of a car, and creates an instance of that vehicle.  Test it. 
* Once you can successfully create a vehicle, create an instance array to store the vehicles, and push the new vehicle into it.  
* Since we want to be able to put more than one vehicle into inventory, call the `display_menu` method to bring the user back to the menu. 

Your code should look *something* like this:
```ruby
@parking_lot = []

class Vehicle
  ...class code...
end

def display_menu
  ...code to display menu...
end 

def add_a_vehicle
  ...code to add a vehicle to inventory...
  car = Vehicle.new(<all the parameters>)
  @parking_lot.push(car)
  display_menu
end

display_menu

```