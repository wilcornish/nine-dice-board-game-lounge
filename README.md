# Nine Dice Board Game Lounge
A web-based application to lend and keep stock of board games for a convention board game lounge. 

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Installing


Clone or download the repository, and run the server file from within the folder nine_dice_library

```
ruby app.rb
```
The app is now running for local access on http://localhost:4567

This will include seeded demonstration data, to remove or modify this, modify the file: 
```
nine_dice_library/db/seeds.rb
```

## Testing

Unit tests can be run through

```
ruby models/specs/MODEL_spec.rb 
```

Where MODEL is the name of a given model within the application. 


## Built With

* Ruby
* [Sinatra](http://sinatrarb.com)

## Author

* **[WilCornish](https://github.com/WilCornish)**


## Acknowledgments

* CodeClan
* John Harper
* Clare Jones
