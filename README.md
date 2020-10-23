## Cheeso

Cheeso is an app that allows users to browse, look, and buy cheeses.

Created by **Roober Cruz**, **Mytzy Escalante Godinez**, **Miguel Espitia**, **Carmelo Hernandez**

### User Stories

Required Functions Completed:
* [x] Users can log in and see the list of cheeses.
* [x] Users can buy cheeses in stock on the shopping cart.
* [x] Cheese stock persists and stays.
* [x] Users can edit their details.

**MUSTHAVES**:
* [x] Express API
* [x] MySQL
* [x] Uses git 
* [x] Uses heroku
* [x] Uses JawsDB

### Iteration 1
**User Story:** Set up backend functionality by Roober:
> I started out with setting up the index.js file that uses Express API for the handling
> of routes. I also set up the back end code for creating a new account/registering and logging in.

**User Story:** Set up SQL file by Miguel:
> My first user story assigned was the SQL file which was an important user story to get done early.
> Mainly because it goes hand in hand with the backend and frontend of the project.

**User Story:** Set up MySQL and Database by Mytzy:
> I created mysql database and connected the sql file. I had to create a user in order to access the
> database tables so we could delete or recreate tables if we ever needed to.
> I also did the frontend implementation for home, login, and register pages.

**User Story:** Started the Shopping Cart page by Carmelo:
> I started the Shopping Cart in HTML using hard code values to figure out how to make the calculations because in this week 
> the databases was set up. After the database was created, I had some problems taking the values
> from it, but Roober, Mytzy, and Miguel helped me to solve it.  

### Iteration 2
**User Story:** Edited SQL file and started on inventory page by Roober:
> I helped Miguel with the SQL file and implemented cart and cartItem tables. Unfortunately, we realized that
> we did not need those with the way that the shoppingcart page was set up. I also set up the inventory page
> with Carmelo and Mytzy and Miguel styled it.

**User Story:** Updates/changes on SQL by Miguel:
> As stated by Roober, we had to make changes to the SQL file and add files we would need later. We added the
> cart and cartItem tables, but when we reached the ejs file for cart, we realized they were unnecessary.
> During this week I also helped Mytzy and Carmelo with frontend styling, HTML/CSS.

**User Story:** Set Up Heroku by Mytzy:
> In this week, I set up heroku in order to display a running application in the walkthrough.
> In order to connect heroku and have it running, I needed to use JawsDB so we could connect it with our mysql.
> Once creating a database of Jaws, I recreated the sql so it could reconnect with our code.

**User Story:** Implemented Shopping Cart page by Carmelo:
> In this week, I continuing implemented the Shopping Cart page in HTML to use forms and take the values from the products ids,
> then I converted the Shopping Cart page from HTML to ejs.

### Iteration 3
**User Story:** Worked on product details page by Roober:
> This iteration, I worked on populating the productDetails.ejs / "inventory/cheeseId" page with the right
> details of the product.

**User Story:** Frontend stuff by Miguel:
> This week was slower, in that I just worked on fixing stuff that didn't look right on the frontend part of
> the project.

**User Story:** Editted Frontend and fixed small changes with heroku by Mytzy:
> This week I worked on editing small changes in the frontend so the webpages could have a better design.
> I also made small changes in the JawsDB because we were having some problems when deploying to heroku.

**User Story:** Implemented the app.js by Carmelo:
> In this week I created the app.js to make the calculations of the products in the Shopping Cart page,
> this application makes the calculations of subtotal, taxes, and total in real time.

### Iteration 4
**User Story:** Set up the admin pages and fixed shopping cart by Roober:
> I set up admin originally to be able to add cheeses and things, but with the way shopping cart set up. We didn't have enough time
> to set up back end stuff to work with the shopping cart nor change the shopping cart at the last minute. Now admin can see the user info as well as
> info of cheeses.

**User Story:** Admin functionality, some backend and styling by Miguel:
> I worked on admin with Roober so that we could be able to have a "store clerk" delete or update products on the products list.
> It soon became apparent that this was much more complicated than we intially thought. Although we couldn't make use of it,
> I implemented what would've been for the update and delete, along with backend code to go along with it.
> Finally, I contributed a bit more to the frontend styling so that each card would appear in its own square.

**User Story:** Heroku + Github functionality, designing the frontend in pages by Mytzy:
> This week, I made sure everything was running smoothly with github and heroku so we wouldn't have problems once making the
> final changes to our project. I also did the frontend designing for the following pages: inventory, products, cart, and 
> user profile pages. I added cool designs to this pages so it could be user friendly.

**User Story:** Edit Shopping Cart page and app.js by Carmelo:
> The conversion from HTML to ejs creates problems in the calculations. With the help of Roober we changed the lines of code
> of every product in a for loop to populate the page from the sql database. Also, I added the directory of the app.js to 
> the header ejs page and the calculations works well again. At the end, Mytzy, Miguel, and Roober helped me to style the Shopping Cart.

### Things we couldn't get done
We could not get admin to add cheeses or remove cheeses from table without breaking the shopping cart or making it too complicated at the end of the project duration. 
