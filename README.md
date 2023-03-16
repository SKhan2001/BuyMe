Buyme Application
Buyme is an online marketplace application where users can create accounts, sell their items, and other users can buy them through an auction like eBay. The application was built using Java for the frontend and SQL for the backend. The auction was timed, and users were alerted if there was an update on the bid. The app also took care of "transactions" to complete a purchase.

Setup
To run the application, you need to have Apache Tomcat and SQL Server installed on your system. After installing these, you can follow the steps below:

Clone the Buyme repository.
Open the SQL Server Management Studio and run the buyme.sql file in the repository to create the database and tables.
Open the project in an IDE like Eclipse or IntelliJ.
Update the db.properties file in the project with your SQL Server credentials.
Run the project on Apache Tomcat.
Features
User Registration and Login
Users can create accounts on Buyme by providing their email address and password. After registration, they can log in to the application using their credentials.

Auctions
Users can create auctions to sell their items. They need to provide details of the item like name, description, starting price, and duration of the auction. Other users can view these auctions and bid on them. The auction is timed, and users are alerted if there is an update on the bid.

Transactions
When an auction ends, the user who placed the highest bid wins the item. Buyme takes care of the transaction by deducting the bid amount from the buyer's account and transferring it to the seller's account.

Admin User and Customer Reps
There is an admin user who can create customer representative users. The job of customer rep users is to answer tickets submitted by regular users. Regular users can contact customer reps for any queries or issues they face while using Buyme.

Transaction History
The database keeps track of users' transaction history, including the items they sold and bought and the transaction amount.

Conclusion
Buyme is an online marketplace application that allows users to buy and sell items through auctions. The application provides features like user registration, auctions, transactions, admin user, and customer reps. The database keeps track of users' transaction history, which can be used for analysis and reporting.
